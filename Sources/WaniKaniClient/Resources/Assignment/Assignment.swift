import Foundation

public struct Assignment: Codable, Equatable {
    public let id: Int
    public let objectType: ResourceObjectType
    public let url: URL
    public let dataUpdatedAt: Date
    public let data: AssignmentData
    
    public init(id: Int,
                url: URL,
                dataUpdatedAt: Date,
                data: AssignmentData) {
        self.id = id
        self.objectType = .assignment
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
