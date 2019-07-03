import Foundation

public struct ReviewStatistic: Codable, Equatable {
    public let id: Int
    public let objectType: ResourceObjectType = .reviewStatistic
    public let url: URL
    public let dataUpdatedAt: Date
    public let data: ReviewStatisticData
    
    private enum CodingKeys: String, CodingKey {
        case id
        case objectType = "object"
        case url
        case dataUpdatedAt = "data_updated_at"
        case data
    }
}
