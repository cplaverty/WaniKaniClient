import Foundation

public struct ResourceCollectionPages: Codable, Equatable {
    /// Maximum number of resources delivered for this collection.
    public var itemsPerPage: Int
    /// The URL of the next page of results. If there are no more results, the value is `nil`.
    public var nextURL: URL?
    /// The URL of the previous page of results. If there are no results at all or no previous page to go to, the value is `nil`.
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
