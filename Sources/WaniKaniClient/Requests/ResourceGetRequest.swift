import Foundation

/// Request to retrieve a single resource using an HTTP `GET` request.
public protocol ResourceGetRequest<Resource> {
    associatedtype Resource: WaniKaniResource
    
    /// The URL of the request.
    var url: URL { get }
}
