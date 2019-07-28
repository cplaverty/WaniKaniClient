import Foundation

public struct UserResource: Codable, Equatable {
    public let objectType: ResourceObjectType
    public let url: URL
    public let dataUpdatedAt: Date
    public let data: UserResourceData
    
    public init(url: URL,
                dataUpdatedAt: Date,
                data: UserResourceData) {
        self.objectType = .user
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
