import Foundation

public struct Review: Codable, Equatable {
    public let id: Int
    public let objectType: ResourceObjectType = .review
    public let url: URL
    public let dataUpdatedAt: Date
    public let data: ReviewData
    
    private enum CodingKeys: String, CodingKey {
        case id
        case objectType = "object"
        case url
        case dataUpdatedAt = "data_updated_at"
        case data
    }
}
