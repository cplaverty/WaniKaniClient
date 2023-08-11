import Foundation

public struct ResourceCollection<Resource: Codable>: Codable {
    public var object: String
    public var url: URL
    public var pages: ResourceCollectionPages
    public var totalCount: Int
    public var dataUpdatedAt: Date?
    public var data: [Resource]
    
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
