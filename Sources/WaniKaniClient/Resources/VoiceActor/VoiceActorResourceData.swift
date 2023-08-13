import Foundation

/// Voice actor resource data.
public struct VoiceActorResourceData: Codable, Equatable {
    /// Timestamp when the voice actor resource was created.
    public var createdAt: Date
    /// The voice actor's name.
    public var name: String
    /// The voice actor's gender.
    public var gender: Gender
    /// Details about the voice actor.
    public var description: String
    
    public init(createdAt: Date,
                name: String,
                gender: Gender,
                description: String) {
        self.createdAt = createdAt
        self.name = name
        self.gender = gender
        self.description = description
    }
    
    private enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case name
        case gender
        case description
    }
}
