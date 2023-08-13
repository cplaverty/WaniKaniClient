import Foundation

/// Review statistic resource data.
public struct ReviewStatisticResourceData: Codable, Equatable {
    /// Timestamp when the review statistic was created.
    public var createdAt: Date
    /// Unique identifier of the associated ``SubjectResource``.
    public var subjectID: Int
    /// The type of the associated ``SubjectResource``.
    public var subjectType: SubjectType
    /// Total number of correct answers submitted for the meaning of the associated subject.
    public var meaningCorrect: Int
    /// Total number of incorrect answers submitted for the meaning of the associated subject.
    public var meaningIncorrect: Int
    /// The longest, uninterrupted series of correct answers ever given for the meaning of the associated subject.
    public var meaningMaxStreak: Int
    /// The current, uninterrupted series of correct answers given for the meaning of the associated subject.
    public var meaningCurrentStreak: Int
    /// Total number of correct answers submitted for the reading of the associated subject.
    public var readingCorrect: Int
    /// Total number of incorrect answers submitted for the reading of the associated subject.
    public var readingIncorrect: Int
    /// The longest, uninterrupted series of correct answers ever given for the reading of the associated subject.
    public var readingMaxStreak: Int
    /// The current, uninterrupted series of correct answers given for the reading of the associated subject.
    public var readingCurrentStreak: Int
    /// The overall correct answer rate by the user for the subject, including both meaning and reading.
    ///
    /// Percentage correct can be calculated by rounding the result of
    /// (
    ///     (``meaningCorrect`` + ``readingCorrect``) /
    ///     (``meaningCorrect``  + ``readingCorrect`` + ``meaningIncorrect`` + ``readingIncorrect``)
    /// ) * 100
    public var percentageCorrect: Int
    /// Indicates if the associated subject has been hidden, preventing it from appearing in lessons or reviews.
    public var isHidden: Bool
    
    public init(createdAt: Date,
                subjectID: Int,
                subjectType: SubjectType,
                meaningCorrect: Int,
                meaningIncorrect: Int,
                meaningMaxStreak: Int,
                meaningCurrentStreak: Int,
                readingCorrect: Int,
                readingIncorrect: Int,
                readingMaxStreak: Int,
                readingCurrentStreak: Int,
                percentageCorrect: Int,
                isHidden: Bool) {
        self.createdAt = createdAt
        self.subjectID = subjectID
        self.subjectType = subjectType
        self.meaningCorrect = meaningCorrect
        self.meaningIncorrect = meaningIncorrect
        self.meaningMaxStreak = meaningMaxStreak
        self.meaningCurrentStreak = meaningCurrentStreak
        self.readingCorrect = readingCorrect
        self.readingIncorrect = readingIncorrect
        self.readingMaxStreak = readingMaxStreak
        self.readingCurrentStreak = readingCurrentStreak
        self.percentageCorrect = percentageCorrect
        self.isHidden = isHidden
    }
    
    private enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case subjectID = "subject_id"
        case subjectType = "subject_type"
        case meaningCorrect = "meaning_correct"
        case meaningIncorrect = "meaning_incorrect"
        case meaningMaxStreak = "meaning_max_streak"
        case meaningCurrentStreak = "meaning_current_streak"
        case readingCorrect = "reading_correct"
        case readingIncorrect = "reading_incorrect"
        case readingMaxStreak = "reading_max_streak"
        case readingCurrentStreak = "reading_current_streak"
        case percentageCorrect = "percentage_correct"
        case isHidden = "hidden"
    }
}
