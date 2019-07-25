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
    
    public func loadRequest<Request: ResourceRequest>(_ request: Request, completionHandler: @escaping (Result<Request.Resource, Error>) -> Void) -> Progress {
        let requestTask = ResourceRequestTask<Request.Resource>(totalUnitCount: 1)
        
        let task = dataTask(with: request.requestURL) { (data, response, error) in
            do {
                let resource = try self.decodeResource(from: data, response: response, error: error, resourceDecoder: request.decodeResource(from:))
                requestTask.progress.completedUnitCount = 1
                
                completionHandler(.success(resource))
            } catch let error as URLError where error.code == .cancelled {
                // Ignore cancellation errors
                requestTask.progress.completedUnitCount = 1
            } catch {
                requestTask.progress.completedUnitCount = 1
                completionHandler(.failure(error))
            }
        }
        
        requestTask.addAndResume(task)
        
        return requestTask.progress
    }
    
    public func loadCollectionRequest<Request: ResourceCollectionRequest>(_ request: Request, completionHandler: @escaping (Result<[Request.Resource], Error>) -> Void) -> Progress {
        let requestTask = ResourceRequestTask<Request.Resource>()
        
        let task = loadCollectionPage(with: request.requestURL, requestTask: requestTask, resourceDecoder: request.decodeResource(from:), completionHandler: completionHandler)
        requestTask.addAndResume(task)
        
        return requestTask.progress
    }
    
    private func loadCollectionPage<Resource>(with url: URL, requestTask: ResourceRequestTask<Resource>, resourceDecoder: @escaping (Data) throws -> ResourceCollection<Resource>, completionHandler: @escaping (Result<[Resource], Error>) -> Void) -> URLSessionDataTask {
        let task = dataTask(with: url) { (data, response, error) in
            let resources: ResourceCollection<Resource>
            do {
                resources = try self.decodeResource(from: data, response: response, error: error, resourceDecoder: resourceDecoder)
                
                requestTask.progress.completedUnitCount += 1
                if requestTask.resources.capacity < resources.totalCount {
                    requestTask.resources.reserveCapacity(resources.totalCount)
                }
                requestTask.resources += resources.data
            } catch let error as URLError where error.code == .cancelled {
                // Do not notify errors due to cancellation
                if requestTask.progress.totalUnitCount > 0 {
                    requestTask.progress.completedUnitCount = requestTask.progress.totalUnitCount
                }
                return
            } catch {
                if requestTask.progress.totalUnitCount > 0 {
                    requestTask.progress.completedUnitCount = requestTask.progress.totalUnitCount
                }
                _ = completionHandler(.failure(error))
                return
            }
            
            requestTask.progress.totalUnitCount = Int64(resources.estimatedPageCount)
            
            guard !requestTask.isCancelled else { return }
            
            if let nextURL = resources.pages.nextURL {
                requestTask.addAndResume(self.loadCollectionPage(with: nextURL, requestTask: requestTask, resourceDecoder: resourceDecoder, completionHandler: completionHandler))
            } else {
                completionHandler(.success(requestTask.resources))
            }
        }
        
        return task
    }
    
    private func decodeResource<Resource>(from data: Data?, response: URLResponse?, error: Error?, resourceDecoder: (Data) throws -> Resource) throws -> Resource {
        if let error = error {
            throw error
        }
        
        let httpResponse = response as? HTTPURLResponse
        let httpStatusCode = httpResponse?.statusCode ?? 200
        let httpStatusCodeDescription = HTTPURLResponse.localizedString(forStatusCode: httpStatusCode)
        
        if let data = data {
            os_log("Response: %{public}@ (%d), %{iec-bytes}d received", type: .debug, httpStatusCodeDescription, httpStatusCode, data.count)
        } else {
            os_log("Response: %{public}@ (%d) <no data>", type: .debug, httpStatusCodeDescription, httpStatusCode)
        }
        
        switch httpStatusCode {
        case 200:
            guard let data = data else {
                throw WaniKaniClientError.noContent
            }
            return try resourceDecoder(data)
        case 401:
            throw WaniKaniClientError.invalidAPIKey
        case 429:
            throw WaniKaniClientError.tooManyRequests
        case 400 ..< 600:
            if let data = data, let error = try? JSONDecoder().decode(WaniKaniClientError.self, from: data) {
                os_log("Error message received: %{public}@", type: .debug, error.localizedDescription)
                throw error
            }
            throw WaniKaniClientError.unknownError(httpStatusCode: httpStatusCode, message: httpStatusCodeDescription)
        default:
            throw WaniKaniClientError.unhandledStatusCode(httpStatusCode: httpStatusCode, data: data)
        }
    }
    
    private func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        urlRequest.setValue(Self.apiRevision, forHTTPHeaderField: "Wanikani-Revision")
        
        os_log("Initiating request for %@", type: .debug, url.absoluteString)
        
        let task = urlSession.dataTask(with: urlRequest, completionHandler: completionHandler)
        
        return task
    }
}
