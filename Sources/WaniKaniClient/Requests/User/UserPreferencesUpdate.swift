/// User settings specific to the WaniKani application.
public struct UserPreferencesUpdate: Codable, Equatable {
    /// The voice actor to be used for lessons and reviews. The value is associated to ``VocabularyPronunciationAudioMetadata/voiceActorID``.
    public var defaultVoiceActorID: Int?
    /// Automatically play pronunciation audio for vocabulary during extra study.
    public var extraStudyAutoplayAudio: Bool?
    /// Automatically play pronunciation audio for vocabulary during lessons.
    public var lessonsAutoplayAudio: Bool?
    /// Number of subjects introduced to the user during lessons before quizzing.
    public var lessonsBatchSize: Int?
    /// The order in which lessons are presented.
    public var lessonsPresentationOrder: LessonsPresentationOrder?
    /// Automatically play pronunciation audio for vocabulary during reviews.
    public var reviewsAutoplayAudio: Bool?
    /// Toggle for displaying SRS change indicator after a subject has been completely answered during review.
    public var reviewsDisplaySRSIndicator: Bool?
    /// The order in which reviews are presented.
    public var reviewsPresentationOrder: ReviewsPresentationOrder?
    
    public init(defaultVoiceActorID: Int? = nil,
                extraStudyAutoplayAudio: Bool? = nil,
                lessonsAutoplayAudio: Bool? = nil,
                lessonsBatchSize: Int? = nil,
                lessonsPresentationOrder: LessonsPresentationOrder? = nil,
                reviewsAutoplayAudio: Bool? = nil,
                reviewsDisplaySRSIndicator: Bool? = nil,
                reviewsPresentationOrder: ReviewsPresentationOrder? = nil) {
        self.defaultVoiceActorID = defaultVoiceActorID
        self.extraStudyAutoplayAudio = extraStudyAutoplayAudio
        self.lessonsAutoplayAudio = lessonsAutoplayAudio
        self.lessonsBatchSize = lessonsBatchSize
        self.lessonsPresentationOrder = lessonsPresentationOrder
        self.reviewsAutoplayAudio = reviewsAutoplayAudio
        self.reviewsDisplaySRSIndicator = reviewsDisplaySRSIndicator
        self.reviewsPresentationOrder = reviewsPresentationOrder
    }
    
    private enum CodingKeys: String, CodingKey {
        case defaultVoiceActorID = "default_voice_actor_id"
        case extraStudyAutoplayAudio = "extra_study_autoplay_audio"
        case lessonsAutoplayAudio = "lessons_autoplay_audio"
        case lessonsBatchSize = "lessons_batch_size"
        case lessonsPresentationOrder = "lessons_presentation_order"
        case reviewsAutoplayAudio = "reviews_autoplay_audio"
        case reviewsDisplaySRSIndicator = "reviews_display_srs_indicator"
        case reviewsPresentationOrder = "reviews_presentation_order"
    }
}
