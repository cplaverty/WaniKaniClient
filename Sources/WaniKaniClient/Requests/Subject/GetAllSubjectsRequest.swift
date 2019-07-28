import Foundation

public struct GetAllSubjectsRequest {
    public var ids: [Int]?
    public var types: [SubjectType]?
    public var slugs: [String]?
    public var levels: [Int]?
    public var isHidden: Bool?
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

extension GetAllSubjectsRequest: ResourceCollectionRequest {
    public typealias Resource = SubjectResource
    
    public var requestURL: URL {
        let url = ResourceEndpoints.shared.subjects
        
        var queryItems = [URLQueryItem]()
        queryItems.appendItemsIfSet(name: "ids", values: ids)
        queryItems.appendItemsIfSet(name: "types", values: types)
        queryItems.appendItemsIfSet(name: "slugs", values: slugs)
        queryItems.appendItemsIfSet(name: "levels", values: levels)
        queryItems.appendItemIfSet(name: "hidden", value: isHidden)
        queryItems.appendItemIfSet(name: "updated_after", value: updatedAfter)
        
        guard !queryItems.isEmpty else {
            return url
        }
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = queryItems
        return urlComponents.url!
    }
}
