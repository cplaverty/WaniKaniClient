import Foundation

public struct LevelProgressionResource: Codable, Equatable {
    public var id: Int
    public let objectType: ResourceObjectType = .levelProgression
    public var url: URL
    public var dataUpdatedAt: Date
    public var data: LevelProgressionResourceData
    
    public init(id: Int,
                url: URL,
                dataUpdatedAt: Date,
                data: LevelProgressionResourceData) {
        self.id = id
        self.url = url
        self.dataUpdatedAt = dataUpdatedAt
        self.data = data
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case objectType = "object"
        case url
        case dataUpdatedAt = "data_updated_at"
        case data
    }
}
