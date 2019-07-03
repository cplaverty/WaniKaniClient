import Foundation

public struct GetAllLevelProgressionsRequest {
    public var ids: [Int]?
    public var updatedAfter: Date?
    
    public init(ids: [Int]? = nil,
                updatedAfter: Date? = nil) {
        self.ids = ids
        self.updatedAfter = updatedAfter
    }
}

extension GetAllLevelProgressionsRequest: ResourceCollectionRequest {
    public typealias Resource = LevelProgression
    
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
