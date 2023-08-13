import Foundation

/// Returns a collection of all level progressions, ordered by ascending ``LevelProgressionResourceData/createdAt``,
/// 500 at a time.
///
/// > Important: Logging for this endpoint has been implemented late in the application's life. Therefore, some
/// users will not have a full history.
public struct GetAllLevelProgressionsRequest {
    /// Only level progressions where ``LevelProgressionResource/id`` matches one of the array values are returned.
    public var ids: [Int]?
    /// Only levelProgressions updated after this time are returned.
    public var updatedAfter: Date?
    
    public init(ids: [Int]? = nil,
                updatedAfter: Date? = nil) {
        self.ids = ids
        self.updatedAfter = updatedAfter
    }
}

extension GetAllLevelProgressionsRequest: ResourceCollectionGetRequest {
    public typealias Resource = LevelProgressionResource
    
    public var requestURL: URL {
        let url = ResourceEndpoints.shared.levelProgressions
        
        var queryItems = [URLQueryItem]()
        queryItems.appendItemsIfSet(name: "ids", values: ids)
        queryItems.appendItemIfSet(name: "updated_after", value: updatedAfter)
        
        guard !queryItems.isEmpty else {
            return url
        }
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = queryItems
        return urlComponents.url!
    }
}
