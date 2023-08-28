import Foundation

public protocol ResourceRequestClient {
    func resource<Resource>(for request: some ResourceGetRequest<Resource>) async throws -> Resource
    func resources<Resource>(for request: some ResourceCollectionGetRequest<Resource>) -> AsyncThrowingStream<ResourceCollection<Resource>, Error>
    func updateResource<Resource>(for request: some ResourceUpdateRequest<Resource>) async throws -> Resource
}
