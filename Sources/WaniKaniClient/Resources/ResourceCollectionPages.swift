import Foundation

public struct ResourceCollectionPages: Codable, Equatable {
    public let previousURL: URL?
    public let nextURL: URL?
    public let itemsPerPage: Int
    
    private enum CodingKeys: String, CodingKey {
        case previousURL = "previous_url"
        case nextURL = "next_url"
        case itemsPerPage = "per_page"
    }
}
