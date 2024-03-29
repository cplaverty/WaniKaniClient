import Foundation

/// Retrieves a specific voice actor by its ``VoiceActorResource/id``.
public struct GetVoiceActorRequest {
    /// Unique identifier of the voice actor.
    public var id: Int
    
    public init(id: Int) {
        self.id = id
    }
}

extension GetVoiceActorRequest: ResourceGetRequest {
    public typealias Resource = VoiceActorResource
    
    public var url: URL {
        return ResourceEndpoints.shared.voiceActors.appendingPathComponent("\(id)")
    }
}
