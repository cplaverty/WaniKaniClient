import Foundation

/// Review resource data.
///
/// > Incorrect Answers:
/// A subject may not require a meaning or reading. Therefore attributes ``incorrectMeaningAnswers`` and
/// ``incorrectReadingAnswers`` will return a value of 0 for subjects which do not have the requirement.
///
/// | Subject type | Answer types allowed |
/// | ------------ | -------------------- |
/// | ``SubjectType/kanaVocabulary`` | Meaning |
/// | ``SubjectType/kanji`` | Meaning, Reading |
/// | ``SubjectType/radical`` | Meaning |
/// | ``SubjectType/vocabulary`` | Meaning, Reading |
///
/// > Spaced Repetition System:
/// The associated spaced repetition system is the system used to do the SRS stage calculations at the time the
/// review record was created. It does not necessarily mean it is the current spacedRepetitionSystem associated to
/// subject. This is done to preserve history.
public struct ReviewResourceData: Codable, Equatable {
    /// Timestamp when the review was created.
    public var createdAt: Date
    /// Unique identifier of the associated ``AssignmentResource``.
    public var assignmentID: Int
    /// Unique identifier of the associated ``SpacedRepetitionSystemResource``.
    public var spacedRepetitionSystemID: Int
    /// Unique identifier of the associated ``SubjectResource``.
    public var subjectID: Int
    /// The starting SRS stage interval, with valid values ranging from 1 to 8.
    public var startingSRSStage: Int
    /// The SRS stage interval calculated from the number of correct and incorrect answers, with valid values ranging from 1 to 9.
    public var endingSRSStage: Int
    /// The number of times the user has answered the meaning incorrectly.
    public var incorrectMeaningAnswers: Int
    /// The number of times the user has answered the reading incorrectly.
    public var incorrectReadingAnswers: Int
    
    public init(createdAt: Date,
                assignmentID: Int,
                spacedRepetitionSystemID: Int,
                subjectID: Int,
                startingSRSStage: Int,
                endingSRSStage: Int,
                incorrectMeaningAnswers: Int,
                incorrectReadingAnswers: Int) {
        self.createdAt = createdAt
        self.assignmentID = assignmentID
        self.spacedRepetitionSystemID = spacedRepetitionSystemID
        self.subjectID = subjectID
        self.startingSRSStage = startingSRSStage
        self.endingSRSStage = endingSRSStage
        self.incorrectMeaningAnswers = incorrectMeaningAnswers
        self.incorrectReadingAnswers = incorrectReadingAnswers
    }
    
    private enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case assignmentID = "assignment_id"
        case spacedRepetitionSystemID = "spaced_repetition_system_id"
        case subjectID = "subject_id"
        case startingSRSStage = "starting_srs_stage"
        case endingSRSStage = "ending_srs_stage"
        case incorrectMeaningAnswers = "incorrect_meaning_answers"
        case incorrectReadingAnswers = "incorrect_reading_answers"
    }
}
