import Foundation

public struct GetAllResetsRequest {
    public var ids: [Int]?
    public var updatedAfter: Date?
    
    public init(ids: [Int]? = nil,
                updatedAfter: Date? = nil) {
        self.ids = ids
        self.updatedAfter = updatedAfter
    }
}

extension GetAllResetsRequest: ResourceCollectionRequest {
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
