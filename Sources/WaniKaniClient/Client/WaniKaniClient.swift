import Foundation
import os.log

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
    
    public func loadRequest<Request: ResourceRequest>(_ request: Request) async throws -> Request.Resource {
        let resource = try await loadResource(from: request.requestURL, resourceDecoder: request.decodeResource(from:))
        return resource
    }
    
    public func loadCollectionRequest<Request: ResourceCollectionRequest>(_ request: Request) async throws -> [Request.Resource] {
        var resourceCollection = try await loadResource(from: request.requestURL, resourceDecoder: request.decodeResource(from:))
        var resources = resourceCollection.data

        while let nextURL = resourceCollection.pages.nextURL {
            resourceCollection = try await loadResource(from: nextURL, resourceDecoder: request.decodeResource(from:))
            resources += resourceCollection.data
        }
        
        return resources
    }
    
    private func loadResource<Resource>(from url: URL, resourceDecoder: (Data) throws -> Resource) async throws -> Resource {
        let (data, response) = try await data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw WaniKaniClientError.invalidServerResponse
        }
        
        let httpStatusCode = httpResponse.statusCode
        let httpStatusCodeDescription = HTTPURLResponse.localizedString(forStatusCode: httpStatusCode)
        
        os_log("Response: %{public}@ (%d), %{iec-bytes}d received", type: .debug, httpStatusCodeDescription, httpStatusCode, data.count)
        
        switch httpStatusCode {
        case 200:
            return try resourceDecoder(data)
        case 401:
            throw WaniKaniClientError.invalidAPIKey
        case 429:
            throw WaniKaniClientError.tooManyRequests
        case 400 ..< 600:
            if let error = try? JSONDecoder().decode(WaniKaniClientError.self, from: data) {
                os_log("Error message received: %{public}@", type: .debug, error.localizedDescription)
                throw error
            }
            throw WaniKaniClientError.unknownError(httpStatusCode: httpStatusCode, message: httpStatusCodeDescription)
        default:
            throw WaniKaniClientError.unhandledStatusCode(httpStatusCode: httpStatusCode, data: data)
        }
    }
    
    private func data(from url: URL) async throws -> (Data, URLResponse) {
        let urlRequest = makeURLRequest(url: url)
        
        os_log("Initiating request for %@", type: .debug, url.absoluteString)
        return try await urlSession.data(for: urlRequest)
    }
    
    private func makeURLRequest(url: URL) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        urlRequest.setValue(Self.apiRevision, forHTTPHeaderField: "Wanikani-Revision")
        
        return urlRequest
    }
}
