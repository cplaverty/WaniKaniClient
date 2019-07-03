import Foundation

public struct LevelProgression: Codable, Equatable {
    public let id: Int
    public let objectType: ResourceObjectType = .levelProgression
    public let url: URL
    public let dataUpdatedAt: Date
    public let data: LevelProgressionData
    
    private enum CodingKeys: String, CodingKey {
        case id
        case objectType = "object"
        case url
        case dataUpdatedAt = "data_updated_at"
        case data
    }
}
