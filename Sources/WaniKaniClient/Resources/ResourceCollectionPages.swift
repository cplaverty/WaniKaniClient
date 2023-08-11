import Foundation

public struct ResourceCollectionPages: Codable, Equatable {
    public var itemsPerPage: Int
    public var nextURL: URL?
    public var previousURL: URL?
    
    public init(itemsPerPage: Int,
                nextURL: URL? = nil,
                previousURL: URL? = nil) {
        self.itemsPerPage = itemsPerPage
        self.nextURL = nextURL
        self.previousURL = previousURL
    }
    
    private enum CodingKeys: String, CodingKey {
        case itemsPerPage = "per_page"
        case nextURL = "next_url"
        case previousURL = "previous_url"
    }
}
