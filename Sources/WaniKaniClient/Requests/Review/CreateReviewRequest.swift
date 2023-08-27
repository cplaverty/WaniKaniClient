import Foundation

/// Creates a review for a specific ``ReviewResourceData/assignmentID`` or ``ReviewResourceData/subjectID``.
///
/// Some criteria must be met in order for a review to be created: ``AssignmentResourceData/availableAt`` must be not `nil` and in the past.
///
/// When a review is registered, the associated ``AssignmentResource`` and ``ReviewStatisticResource`` are both updated.
public struct CreateReviewRequest {
    /// Unique identifier of the associated ``AssignmentResource``. This or ``subjectID`` must be set.
    public var assignmentID: Int?
    /// Unique identifier of the associated ``SubjectResource``. This or ``assignmentID`` must be set.
    public var subjectID: Int?
    /// Must be zero or a positive number. This is the number of times the meaning was answered *incorrectly*.
    public var incorrectMeaningAnswers: Int
    /// Must be zero or a positive number. This is the number of times the reading was answered *incorrectly*.
    /// Note that subjects with a type of ``SubjectType/radical`` do not quiz on readings. Thus, set this value to 0.
    public var incorrectReadingAnswers: Int
    /// Timestamp when the review was completed. Defaults to the time of the request if omitted.
    /// Must be in the past, but after ``AssignmentResourceData/availableAt``.
    public var createdAt: Date?
    
    public init(assignmentID: Int,
                incorrectMeaningAnswers: Int,
                incorrectReadingAnswers: Int,
                createdAt: Date? = nil) {
        self.assignmentID = assignmentID
        self.subjectID = nil
        self.incorrectMeaningAnswers = incorrectMeaningAnswers
        self.incorrectReadingAnswers = incorrectReadingAnswers
        self.createdAt = createdAt
    }
    
    public init(subjectID: Int,
                incorrectMeaningAnswers: Int,
                incorrectReadingAnswers: Int,
                createdAt: Date? = nil) {
        self.assignmentID = nil
        self.subjectID = subjectID
        self.incorrectMeaningAnswers = incorrectMeaningAnswers
        self.incorrectReadingAnswers = incorrectReadingAnswers
        self.createdAt = createdAt
    }
}

extension CreateReviewRequest: ResourceUpdateRequest, Codable {
    public typealias Resource = CreatedReviewResource
    
    public var url: URL {
        return ResourceEndpoints.shared.reviews
    }
    
    public var httpMethod: String {
        return "POST"
    }
    
    public var bodyContent: Codable {
        return BodyContent(review: self)
    }
    
    private enum CodingKeys: String, CodingKey {
        case assignmentID = "assignment_id"
        case subjectID = "subject_id"
        case incorrectMeaningAnswers = "incorrect_meaning_answers"
        case incorrectReadingAnswers = "incorrect_reading_answers"
        case createdAt = "created_at"
    }
    
    private struct BodyContent: Codable {
        var review: CreateReviewRequest
        
        private enum CodingKeys: String, CodingKey {
            case review
        }
    }
}
