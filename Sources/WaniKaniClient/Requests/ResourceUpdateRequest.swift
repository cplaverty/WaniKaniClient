import Foundation

/// Request to create or update a single resource using an HTTP `POST` or `PUT` request.
public protocol ResourceUpdateRequest {
    associatedtype Resource: WaniKaniResource
    
    /// The URL of the request.
    var url: URL { get }
    /// The HTTP request method.
    var httpMethod: String { get }
    /// The object to be encoded and sent as the message body of the request.
    var bodyContent: Codable { get }
}
