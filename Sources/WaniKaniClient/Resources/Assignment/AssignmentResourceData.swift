import Foundation

/// Assignment resource data.
public struct AssignmentResourceData: Codable, Equatable {
    /// Timestamp when the assignment was created.
    public var createdAt: Date
    /// Unique identifier of the associated ``SubjectResource``.
    public var subjectID: Int
    /// The type of the associated ``SubjectResource``.
    public var subjectType: SubjectType
    /// The current SRS stage interval. The interval range is determined by the related subject's spaced repetition system.
    public var srsStage: Int
    /// The timestamp when the related subject has its prerequisites satisfied and is made available in lessons.
    ///
    /// Prerequisites are:
    /// - The subject components have reached SRS stage 5 once (they have been “passed”).
    /// - The user's level is equal to or greater than the level of the assignment’s subject.
    public var unlockedAt: Date?
    /// Timestamp when the user completes the lesson for the related subject.
    public var startedAt: Date?
    /// Timestamp when the user reaches SRS stage 5 for the first time.
    public var passedAt: Date?
    /// Timestamp when the user reaches SRS stage 9 the first time.
    public var burnedAt: Date?
    /// Timestamp when the related subject will be available in the user's review queue.
    public var availableAt: Date?
    /// Timestamp when the subject is resurrected and placed back in the user's review queue.
    public var resurrectedAt: Date?
    /// Indicates if the associated subject has been hidden, preventing it from appearing in lessons or reviews.
    public var isHidden: Bool
    
    public init(createdAt: Date,
                subjectID: Int,
                subjectType: SubjectType,
                srsStage: Int,
                unlockedAt: Date? = nil,
                startedAt: Date? = nil,
                passedAt: Date? = nil,
                burnedAt: Date? = nil,
                availableAt: Date? = nil,
                resurrectedAt: Date? = nil,
                isHidden: Bool) {
        self.createdAt = createdAt
        self.subjectID = subjectID
        self.subjectType = subjectType
        self.srsStage = srsStage
        self.unlockedAt = unlockedAt
        self.startedAt = startedAt
        self.passedAt = passedAt
        self.burnedAt = burnedAt
        self.availableAt = availableAt
        self.resurrectedAt = resurrectedAt
        self.isHidden = isHidden
    }
    
    private enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case subjectID = "subject_id"
        case subjectType = "subject_type"
        case srsStage = "srs_stage"
        case unlockedAt = "unlocked_at"
        case startedAt = "started_at"
        case passedAt = "passed_at"
        case burnedAt = "burned_at"
        case availableAt = "available_at"
        case resurrectedAt = "resurrected_at"
        case isHidden = "hidden"
    }
}
