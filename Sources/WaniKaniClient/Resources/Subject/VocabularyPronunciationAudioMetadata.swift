public struct VocabularyPronunciationAudioMetadata: Codable, Equatable {
    public var gender: String
    public var sourceID: Int
    public var pronunciation: String
    public var voiceActorID: Int
    public var voiceActorName: String
    public var voiceDescription: String
    
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
