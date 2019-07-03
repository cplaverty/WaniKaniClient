import Foundation

public struct ResourceCollection<Resource: Codable>: Codable {
    public let object: String
    public let url: URL
    public let pages: ResourceCollectionPages
    public let totalCount: Int
    public let dataUpdatedAt: Date?
    public let data: [Resource]
    
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

public extension ResourceCollection {
    var estimatedPageCount: Int {
        let (quotient, remainder) = totalCount.quotientAndRemainder(dividingBy: pages.itemsPerPage)
        return remainder > 0 ? quotient + 1 : quotient
    }
}
