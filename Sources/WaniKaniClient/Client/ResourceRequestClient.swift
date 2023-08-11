import Foundation

public protocol ResourceRequestClient {
    func loadRequest<Request: ResourceRequest>(_ request: Request) async throws -> Request.Resource
    func loadCollectionRequest<Request: ResourceCollectionRequest>(_ request: Request) -> AsyncThrowingStream<ResourceCollection<Request.Resource>, Error>
}
