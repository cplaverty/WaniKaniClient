import Foundation

public struct ReviewResource: WaniKaniResource {
    public var id: Int
    public let objectType: ResourceObjectType = .review
    public var url: URL
    public var dataUpdatedAt: Date
    public var data: ReviewResourceData
    
    public init(id: Int,
                url: URL,
                dataUpdatedAt: Date,
                data: ReviewResourceData) {
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
