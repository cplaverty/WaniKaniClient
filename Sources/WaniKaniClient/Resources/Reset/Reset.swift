import Foundation

public struct Reset: Codable, Equatable {
    public let id: Int
    public let objectType: ResourceObjectType = .reset
    public let url: URL
    public let dataUpdatedAt: Date
    public let data: ResetData
    
    private enum CodingKeys: String, CodingKey {
        case id
        case objectType = "object"
        case url
        case dataUpdatedAt = "data_updated_at"
        case data
    }
}
