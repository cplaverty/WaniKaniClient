import Foundation

public struct UserResource: WaniKaniResource {
    public let objectType: ResourceObjectType = .user
    public var url: URL
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
