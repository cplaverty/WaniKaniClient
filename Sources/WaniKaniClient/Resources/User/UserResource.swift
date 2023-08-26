import Foundation

/// The user summary returns basic information for the user making the API request, identified by their API key.
public struct UserResource: WaniKaniResource, Equatable {
    /// The kind of object returned.
    public let objectType: ResourceObjectType = .user
    /// The URL of the request.
    public var url: URL
    /// The last time that particular resource was updated.
    public var dataUpdatedAt: Date
    public var data: UserResourceData
    
    public init(url: URL,
                dataUpdatedAt: Date,
                data: UserResourceData) {
        self.url = url
        self.dataUpdatedAt = dataUpdatedAt
        self.data = data
    }
    
    private enum CodingKeys: String, CodingKey {
        case objectType = "object"
        case url
        case dataUpdatedAt = "data_updated_at"
        case data
    }
}
