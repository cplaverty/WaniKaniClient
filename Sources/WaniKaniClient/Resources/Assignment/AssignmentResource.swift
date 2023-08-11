import Foundation

public struct AssignmentResource: WaniKaniResource {
    public var id: Int
    public let objectType: ResourceObjectType = .assignment
    public var url: URL
    public var dataUpdatedAt: Date
    public var data: AssignmentResourceData
    
    public init(id: Int,
                url: URL,
                dataUpdatedAt: Date,
                data: AssignmentResourceData) {
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
