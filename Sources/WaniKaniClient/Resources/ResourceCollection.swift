import Foundation

public struct ResourceCollection<Resource: Codable>: Codable {
    public let object: String
    public let url: URL
    public let pages: ResourceCollectionPages
    public let totalCount: Int
    public let dataUpdatedAt: Date?
    public let data: [Resource]
    
    public init(object: String,
                url: URL,
                pages: ResourceCollectionPages,
                totalCount: Int,
                dataUpdatedAt: Date?,
                data: [Resource]) {
        self.object = object
        self.url = url
        self.pages = pages
        self.totalCount = totalCount
        self.dataUpdatedAt = dataUpdatedAt
        self.data = data
    }
    
    private enum CodingKeys: String, CodingKey {
        case object
        case url
        case pages
        case totalCount = "total_count"
        case dataUpdatedAt = "data_updated_at"
        case data
    }
}

extension ResourceCollection: Equatable where Resource: Equatable {}
