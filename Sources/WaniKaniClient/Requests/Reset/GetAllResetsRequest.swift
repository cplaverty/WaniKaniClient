import Foundation

/// Returns a collection of all resets, ordered by ascending ``ResetResourceData/createdAt``, 500 at a time.
public struct GetAllResetsRequest {
    /// Only resets where ``ResetResource/id`` matches one of the array values are returned.
    public var ids: [Int]?
    /// Only resets updated after this time are returned.
    public var updatedAfter: Date?
    
    public init(ids: [Int]? = nil,
                updatedAfter: Date? = nil) {
        self.ids = ids
        self.updatedAfter = updatedAfter
    }
}

extension GetAllResetsRequest: ResourceCollectionGetRequest {
    public typealias Resource = ResetResource
    
    public var requestURL: URL {
        let url = ResourceEndpoints.shared.resets
        
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
