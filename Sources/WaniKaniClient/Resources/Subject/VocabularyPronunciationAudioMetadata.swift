public struct VocabularyPronunciationAudioMetadata: Codable, Equatable {
    public let gender: String
    public let sourceID: Int
    public let pronunciation: String
    public let voiceActorID: Int
    public let voiceActorName: String
    public let voiceDescription: String
    
    public init(gender: String,
                sourceID: Int,
                pronunciation: String,
                voiceActorID: Int,
                voiceActorName: String,
                voiceDescription: String) {
        self.gender = gender
        self.sourceID = sourceID
        self.pronunciation = pronunciation
        self.voiceActorID = voiceActorID
        self.voiceActorName = voiceActorName
        self.voiceDescription = voiceDescription
    }
    
    enum CodingKeys: String, CodingKey {
        case gender
        case sourceID = "source_id"
        case pronunciation
        case voiceActorID = "voice_actor_id"
        case voiceActorName = "voice_actor_name"
        case voiceDescription = "voice_description"
    }
}
