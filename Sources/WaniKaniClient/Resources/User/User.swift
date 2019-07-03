import Foundation

public struct User: Codable, Equatable {
    public let objectType: ResourceObjectType = .user
    public let url: URL
    public let dataUpdatedAt: Date
    public let data: UserData
    
    private enum CodingKeys: String, CodingKey {
        case objectType = "object"
        case url
        case dataUpdatedAt = "data_updated_at"
        case data
    }
}
