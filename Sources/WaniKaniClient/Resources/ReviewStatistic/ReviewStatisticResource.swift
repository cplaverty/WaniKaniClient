import Foundation

public struct ReviewStatisticResource: WaniKaniResource {
    public var id: Int
    public let objectType: ResourceObjectType = .reviewStatistic
    public var url: URL
    public var dataUpdatedAt: Date
    public var data: ReviewStatisticResourceData
    
    public init(id: Int,
                url: URL,
                dataUpdatedAt: Date,
                data: ReviewStatisticResourceData) {
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
