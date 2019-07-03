import Foundation

public struct Assignment: Codable, Equatable {
    public let id: Int
    public let objectType: ResourceObjectType = .assignment
    public let url: URL
    public let dataUpdatedAt: Date
    public let data: AssignmentData
    
    private enum CodingKeys: String, CodingKey {
        case id
        case objectType = "object"
        case url
        case dataUpdatedAt = "data_updated_at"
        case data
    }
}
