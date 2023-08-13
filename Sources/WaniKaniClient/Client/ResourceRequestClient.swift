import Foundation

public protocol ResourceRequestClient {
    func loadRequest<Request: ResourceGetRequest>(_ request: Request) async throws -> Request.Resource
    func loadCollectionRequest<Request: ResourceCollectionGetRequest>(_ request: Request) -> AsyncThrowingStream<ResourceCollection<Request.Resource>, Error>
}
