import Foundation

public protocol ResourceRequestClient {
    func loadRequest<Request: ResourceRequest>(_ request: Request, completionHandler: @escaping (Result<Request.ResponseType, Error>) -> Void) -> Progress
    func loadCollectionRequest<Request: ResourceCollectionRequest>(_ request: Request, completionHandler: @escaping (Result<Request.ResponseType, Error>) -> Bool) -> Progress
}
