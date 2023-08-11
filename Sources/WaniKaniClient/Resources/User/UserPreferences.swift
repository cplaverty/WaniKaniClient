public struct UserPreferences: Codable, Equatable {
    public var lessonsAutoplayAudio: Bool
    public var lessonsBatchSize: Int
    public var lessonsPresentationOrder: LessonsPresentationOrder
    public var reviewsAutoplayAudio: Bool
    public var reviewsDisplaySRSIndicator: Bool
    
    public init(lessonsAutoplayAudio: Bool,
                lessonsBatchSize: Int,
                lessonsPresentationOrder: LessonsPresentationOrder,
                reviewsAutoplayAudio: Bool,
                reviewsDisplaySRSIndicator: Bool) {
        self.lessonsAutoplayAudio = lessonsAutoplayAudio
        self.lessonsBatchSize = lessonsBatchSize
        self.lessonsPresentationOrder = lessonsPresentationOrder
        self.reviewsAutoplayAudio = reviewsAutoplayAudio
        self.reviewsDisplaySRSIndicator = reviewsDisplaySRSIndicator
    }
    
    private enum CodingKeys: String, CodingKey {
        case lessonsAutoplayAudio = "lessons_autoplay_audio"
        case lessonsBatchSize = "lessons_batch_size"
        case lessonsPresentationOrder = "lessons_presentation_order"
        case reviewsAutoplayAudio = "reviews_autoplay_audio"
        case reviewsDisplaySRSIndicator = "reviews_display_srs_indicator"
    }
}
