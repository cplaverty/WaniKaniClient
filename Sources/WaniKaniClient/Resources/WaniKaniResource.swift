import Foundation

public protocol WaniKaniResource: Codable {
    /// The kind of object returned.
    var objectType: ResourceObjectType { get }
    /// The URL of the request.
    var url: URL { get }
    /// The last time that particular resource was updated.
    var dataUpdatedAt: Date { get }
}
