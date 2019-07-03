public struct VocabularyPronunciationAudioMetadata: Codable, Equatable {
    public let gender: String
    public let sourceID: Int
    public let pronunciation: String
    public let voiceActorID: Int
    public let voiceActorName: String
    public let voiceDescription: String
    
    enum CodingKeys: String, CodingKey {
        case gender
        case sourceID = "source_id"
        case pronunciation
        case voiceActorID = "voice_actor_id"
        case voiceActorName = "voice_actor_name"
        case voiceDescription = "voice_description"
    }
}
