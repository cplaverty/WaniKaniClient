import Foundation

public final class WaniKaniClient: ResourceRequestClient {
    public static let apiRevision = "20170710"
    public let apiKey: String
    
    private let urlSession: URLSession
    
    public init(apiKey: String,
                urlSession: URLSession = .shared) {
        self.apiKey = apiKey
        self.urlSession = urlSession
    }
    
    deinit {
        urlSession.invalidateAndCancel()
    }
    
    public func resource<Request: ResourceGetRequest>(for request: Request) async throws -> Request.Resource {
        let resource = try await loadResource(Request.Resource.self, from: request.requestURL)
        logger.log("Loaded resource of type \(Request.Resource.self, privacy: .public)")
        return resource
    }
    
    public func resources<Request: ResourceCollectionGetRequest>(for request: Request) -> AsyncThrowingStream<ResourceCollection<Request.Resource>, Error> {
        AsyncThrowingStream { continuation in
            let task = Task {
                do {
                    var nextURL: URL? = request.requestURL
                    
                    while let url = nextURL {
                        try Task.checkCancellation()
                        
                        let resourceCollection = try await loadResource(ResourceCollection<Request.Resource>.self, from: url)
                        logger.log("Loaded collection of \(resourceCollection.data.count) item(s) of type \(Request.Resource.self, privacy: .public)")
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
    
    private func loadResource<Resource: Codable>(_ type: Resource.Type, from url: URL) async throws -> Resource {
        let (data, response) = try await data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw WaniKaniClientError.invalidServerResponse
        }
        
        let httpStatusCode = httpResponse.statusCode
        let httpStatusCodeDescription = HTTPURLResponse.localizedString(forStatusCode: httpStatusCode)
        
        logger.debug("Response: \(httpStatusCode) (\(httpStatusCodeDescription, privacy: .public)), \(data.count, format: .byteCountIEC) received")
        
        switch httpStatusCode {
        case 200:
            return try ResourceDecoder.shared.decode(Resource.self, from: data)
        case 401:
            logger.error("API Key \(self.apiKey, privacy: .private(mask: .hash)) was rejected by WK API")
            throw WaniKaniClientError.invalidAPIKey
        case 429:
            let resetTime = httpResponse.value(forHTTPHeaderField: "RateLimit-Reset") ?? "<unknown>"
            logger.log("Received 429 (Too Many Requests): rate limit will be reset at \(resetTime, privacy: .public)")
            throw WaniKaniClientError.tooManyRequests
        case 400 ..< 600:
            if let error = try? JSONDecoder().decode(WaniKaniClientError.self, from: data) {
                logger.error("Error message received from WK API: \(error, privacy: .public)")
                throw error
            }
            logger.error("Received HTTP status code \(httpStatusCode) but an unexpected response from the WK server: \(data, privacy: .private)")
            throw WaniKaniClientError.unknownError(httpStatusCode: httpStatusCode, message: httpStatusCodeDescription)
        default:
            logger.error("Received unhandled HTTP status code \(httpStatusCode): \(data, privacy: .private)")
            throw WaniKaniClientError.unhandledStatusCode(httpStatusCode: httpStatusCode, data: data)
        }
    }
    
    private func data(from url: URL) async throws -> (Data, URLResponse) {
        let urlRequest = makeURLRequest(url: url)
        
        logger.info("Initiating request for \(url, privacy: .public)")
        return try await urlSession.data(for: urlRequest)
    }
    
    private func makeURLRequest(url: URL) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        urlRequest.setValue(Self.apiRevision, forHTTPHeaderField: "Wanikani-Revision")
        
        return urlRequest
    }
}
