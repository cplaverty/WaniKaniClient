import Foundation

/// Returns a collection of all spaced repetition systems, ordered by ascending ``SpacedRepetitionSystemResource/id``,
/// 500 at a time.
public struct GetAllSpacedRepetitionSystemsRequest {
    /// Only spaced repetition systems where ``SpacedRepetitionSystemResource/id`` matches one of the array values are returned.
    public var ids: [Int]?
    /// Only spaced repetition systems updated after this time are returned.
    public var updatedAfter: Date?
    
    public init(ids: [Int]? = nil,
                updatedAfter: Date? = nil) {
        self.ids = ids
        self.updatedAfter = updatedAfter
    }
}

extension GetAllSpacedRepetitionSystemsRequest: ResourceCollectionGetRequest {
    public typealias Resource = SpacedRepetitionSystemResource
    
    public var url: URL {
        let url = ResourceEndpoints.shared.spacedRepetitionSystems
        
        var queryItems = [URLQueryItem]()
        queryItems.appendIfSet(name: "ids", values: ids)
        queryItems.appendIfSet(name: "updated_after", date: updatedAfter)
        
        guard !queryItems.isEmpty else {
            return url
        }
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = queryItems
        return urlComponents.url!
    }
}
