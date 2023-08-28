import Foundation

/// The interface for interacting with the WaniKani API.
public protocol ResourceRequestClient {
    /// Retrieves a single resource.
    ///
    /// - Parameter request: The request containing the details of the resource to be retrieved.
    /// - Returns: The resource.
    func resource<Resource>(for request: some ResourceGetRequest<Resource>) async throws -> Resource
    
    /// Retrieves a collection of resources.
    ///
    /// - Parameter request: The request containing the details of the resources to be retrieved.
    /// - Returns: An asynchronous sequence where each element is a page of results.
    func resources<Resource>(for request: some ResourceCollectionGetRequest<Resource>) -> AsyncThrowingStream<ResourceCollection<Resource>, Error>
    
    /// Creates or updates a single resource.
    ///
    /// - Parameter request: The request containing the details of the resource to be created or updated.
    /// - Returns: The created or updated resource.
    func updateResource<Resource>(for request: some ResourceUpdateRequest<Resource>) async throws -> Resource
}
