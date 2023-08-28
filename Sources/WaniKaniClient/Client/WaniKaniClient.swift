import Foundation

/// Client for the WaniKani v2 API.
public final class WaniKaniClient: ResourceRequestClient {
    /// The revision of the WaniKani v2 API supported by this client.
    public static let apiRevision = "20170710"
    public let apiKey: String
    
    private let urlSession: URLSession
    
    /// Creates a WaniKani API client.
    /// 
    /// - Parameters:
    ///   - apiKey: The WaniKani v2 API Key.
    ///   - urlSession: The underlying ``URLSession`` to use for the network requests.
    public init(apiKey: String,
                urlSession: URLSession = .shared) {
        self.apiKey = apiKey
        self.urlSession = urlSession
    }
    
    deinit {
        urlSession.invalidateAndCancel()
    }
    
    public func resource<Resource>(for request: some ResourceGetRequest<Resource>) async throws -> Resource {
        let urlRequest = makeURLRequest(url: request.url)
        let resource = try await decode(Resource.self, for: urlRequest)
        logger.log("Loaded resource of type \(Resource.self, privacy: .public)")
        return resource
    }
    
    public func resources<Resource>(for request: some ResourceCollectionGetRequest<Resource>) -> AsyncThrowingStream<ResourceCollection<Resource>, Error> {
        AsyncThrowingStream { continuation in
            let task = Task {
                do {
                    var nextURL: URL? = request.url
                    
                    while let url = nextURL {
                        try Task.checkCancellation()
                        
                        let urlRequest = makeURLRequest(url: url)
                        let resourceCollection = try await decode(ResourceCollection<Resource>.self, for: urlRequest)
                        logger.log("Loaded collection of \(resourceCollection.data.count) item(s) of type \(Resource.self, privacy: .public)")
                        continuation.yield(resourceCollection)
                        
                        nextURL = resourceCollection.pages.nextURL
                    }
                    
                    continuation.finish()
                } catch {
                    continuation.finish(throwing: error)
                }
            }
            
            continuation.onTermination = { _ in task.cancel() }
        }
    }
    
    public func updateResource<Resource>(for request: some ResourceUpdateRequest<Resource>) async throws -> Resource {
        let urlRequest = try makeURLRequest(url: request.url, httpMethod: request.httpMethod, httpBody: request.bodyContent)
        let resource = try await decode(Resource.self, for: urlRequest)
        logger.log("Updated resource of type \(Resource.self, privacy: .public)")
        return resource
    }
    
    private func decode<Resource: Codable>(_ type: Resource.Type, for urlRequest: URLRequest) async throws -> Resource {
        logger.info("Initiating request for \(urlRequest.url!, privacy: .public)")
        let (data, response) = try await urlSession.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw WaniKaniClientError.invalidServerResponse
        }
        
        let httpStatusCode = httpResponse.statusCode
        let httpStatusCodeDescription = HTTPURLResponse.localizedString(forStatusCode: httpStatusCode)
        
        logger.debug("Response: \(httpStatusCode) (\(httpStatusCodeDescription, privacy: .public)), \(data.count, format: .byteCountIEC) received")
        
        switch httpStatusCode {
        case 200, 201:
            return try ResourceDecoder.shared.decode(Resource.self, from: data)
        case 401:
            logger.error("API Key \(self.apiKey, privacy: .private(mask: .hash)) was rejected by WK API")
            throw WaniKaniClientError.invalidAPIKey
        case 429:
            let resetTime = httpResponse.value(forHTTPHeaderField: "RateLimit-Reset") ?? "<unknown>"
            logger.log("Received 429 (Too Many Requests): rate limit will be reset at \(resetTime, privacy: .public)")
            throw WaniKaniClientError.tooManyRequests
        case 400..<600:
            if let apiError = try? JSONDecoder().decode(WaniKaniAPIError.self, from: data) {
                logger.error("Error message received from WK API: \(apiError, privacy: .public)")
                throw WaniKaniClientError.apiError(error: apiError.error, code: apiError.code)
            }
            logger.error("Received HTTP status code \(httpStatusCode) but an unexpected response from the WK server: \(data, privacy: .private)")
            throw WaniKaniClientError.unknownError(httpStatusCode: httpStatusCode, message: httpStatusCodeDescription)
        default:
            logger.error("Received unhandled HTTP status code \(httpStatusCode): \(data, privacy: .private)")
            throw WaniKaniClientError.unhandledStatusCode(httpStatusCode: httpStatusCode, data: data)
        }
    }
    
    private func makeURLRequest(url: URL) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        urlRequest.setValue(Self.apiRevision, forHTTPHeaderField: "Wanikani-Revision")
        urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        
        return urlRequest
    }
    
    private func makeURLRequest(url: URL, httpMethod: String, httpBody: Codable) throws -> URLRequest {
        var urlRequest = makeURLRequest(url: url)
        urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = httpMethod
        urlRequest.httpBody = try ResourceEncoder.shared.encode(httpBody)
        
        return urlRequest
    }
}
