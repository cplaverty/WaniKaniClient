import Foundation

public struct ResourceCollectionPages: Codable, Equatable {
    public var previousURL: URL?
    public var nextURL: URL?
    public var itemsPerPage: Int
    
    public init(previousURL: URL? = nil,
                nextURL: URL? = nil,
                itemsPerPage: Int) {
        self.previousURL = previousURL
        self.nextURL = nextURL
        self.itemsPerPage = itemsPerPage
    }
    
    private enum CodingKeys: String, CodingKey {
        case previousURL = "previous_url"
        case nextURL = "next_url"
        case itemsPerPage = "per_page"
    }
}
