import Foundation

/// Returns a collection of all subjects, ordered by ascending ``SubjectResourceData/createdAt``, 1000 at a time.
public struct GetAllSubjectsRequest {
    /// Only subjects where ``SubjectResource/id`` matches one of the array values are returned.
    public var ids: [Int]?
    /// Return subjects of the specified types.
    public var types: [SubjectType]?
    /// Return subjects of the specified slug.
    public var slugs: [String]?
    /// Return subjects at the specified levels.
    public var levels: [Int]?
    /// Return subjects which are or are not hidden from the user-facing application.
    public var isHidden: Bool?
    /// Only subjects updated after this time are returned.
    public var updatedAfter: Date?
    
    public init(ids: [Int]? = nil,
                types: [SubjectType]? = nil,
                slugs: [String]? = nil,
                levels: [Int]? = nil,
                isHidden: Bool? = nil,
                updatedAfter: Date? = nil) {
        self.ids = ids
        self.types = types
        self.slugs = slugs
        self.levels = levels
        self.isHidden = isHidden
        self.updatedAfter = updatedAfter
    }
}

extension GetAllSubjectsRequest: ResourceCollectionGetRequest {
    public typealias Resource = SubjectResource
    
    public var url: URL {
        let url = ResourceEndpoints.shared.subjects
        
        var queryItems = [URLQueryItem]()
        queryItems.appendIfSet(name: "ids", values: ids)
        queryItems.appendIfSet(name: "types", values: types)
        queryItems.appendIfSet(name: "slugs", values: slugs)
        queryItems.appendIfSet(name: "levels", values: levels)
        queryItems.appendIfSet(name: "hidden", value: isHidden)
        queryItems.appendIfSet(name: "updated_after", date: updatedAfter)
        
        guard !queryItems.isEmpty else {
            return url
        }
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = queryItems
        return urlComponents.url!
    }
}
