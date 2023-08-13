public struct VocabularyPronunciationAudioMetadata: Codable, Equatable {
    /// The gender of the voice actor.
    public var gender: String
    /// A unique ID shared between same source pronunciation audio.
    public var sourceID: Int
    /// Vocabulary being pronounced in kana.
    public var pronunciation: String
    /// Unique identifier of the associated ``VoiceActorSystemResource``.
    public var voiceActorID: Int
    /// Humanized name of the voice actor.
    public var voiceActorName: String
    /// Description of the voice.
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
