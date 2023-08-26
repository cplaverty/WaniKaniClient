import Foundation

/// Available voice actors used for vocabulary reading pronunciation audio.
public struct VoiceActorResource: WaniKaniResource, Equatable {
    /// Unique identifier of the voice actor.
    public var id: Int
    /// The kind of object returned.
    public let objectType: ResourceObjectType = .voiceActor
    /// The URL of the request.
    public var url: URL
    /// The last time that particular resource was updated.
    public var dataUpdatedAt: Date
    public var data: VoiceActorResourceData
    
    public init(id: Int,
                url: URL,
                dataUpdatedAt: Date,
                data: VoiceActorResourceData) {
        self.id = id
        self.url = url
        self.dataUpdatedAt = dataUpdatedAt
        self.data = data
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case objectType = "object"
        case url
        case dataUpdatedAt = "data_updated_at"
        case data
    }
}
