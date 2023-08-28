import Foundation

/// Request to retrieve a collection of resources using an HTTP `GET` request.
public protocol ResourceCollectionGetRequest<Resource> {
    associatedtype Resource: WaniKaniResource
    
    /// The URL of the request.
    var url: URL { get }
}
