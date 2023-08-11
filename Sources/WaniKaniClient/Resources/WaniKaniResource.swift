import Foundation

public protocol WaniKaniResource: Codable, Equatable {
    var objectType: ResourceObjectType { get }
    var url: URL { get }
    var dataUpdatedAt: Date { get }
}
