import Foundation

/// Returns a collection of all voice actors, ordered by ascending ``VoiceActorResourceData/createdAt``, 500 at a time.
public struct GetAllVoiceActorsRequest {
    /// Only voice actors where ``VoiceActorResource/id`` matches one of the array values are returned.
    public var ids: [Int]?
    /// Only voice actors updated after this time are returned.
    public var updatedAfter: Date?
    
    public init(ids: [Int]? = nil,
                updatedAfter: Date? = nil) {
        self.ids = ids
        self.updatedAfter = updatedAfter
    }
}

extension GetAllVoiceActorsRequest: ResourceCollectionGetRequest {
    public typealias Resource = VoiceActorResource
    
    public var requestURL: URL {
        let url = ResourceEndpoints.shared.voiceActors
        
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
