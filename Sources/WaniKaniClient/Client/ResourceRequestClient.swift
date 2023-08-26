import Foundation

public protocol ResourceRequestClient {
    func resource<Request: ResourceGetRequest>(for request: Request) async throws -> Request.Resource
    func resources<Request: ResourceCollectionGetRequest>(for request: Request) -> AsyncThrowingStream<ResourceCollection<Request.Resource>, Error>
    func updateResource<Request: ResourceUpdateRequest>(for request: Request) async throws -> Request.Resource
}
