import Foundation

public struct ReviewData: Codable, Equatable {
    public let createdAt: Date
    public let assignmentID: Int
    public let subjectID: Int
    public let startingSRSStage: Int
    public let startingSRSStageName: String
    public let endingSRSStage: Int
    public let endingSRSStageName: String
    public let incorrectMeaningAnswers: Int
    public let incorrectReadingAnswers: Int
    
    public init(createdAt: Date,
                assignmentID: Int,
                subjectID: Int,
                startingSRSStage: Int,
                startingSRSStageName: String,
                endingSRSStage: Int,
                endingSRSStageName: String,
                incorrectMeaningAnswers: Int,
                incorrectReadingAnswers: Int) {
        self.createdAt = createdAt
        self.assignmentID = assignmentID
        self.subjectID = subjectID
        self.startingSRSStage = startingSRSStage
        self.startingSRSStageName = startingSRSStageName
        self.endingSRSStage = endingSRSStage
        self.endingSRSStageName = endingSRSStageName
        self.incorrectMeaningAnswers = incorrectMeaningAnswers
        self.incorrectReadingAnswers = incorrectReadingAnswers
    }
    
    private enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case assignmentID = "assignment_id"
        case subjectID = "subject_id"
        case startingSRSStage = "starting_srs_stage"
        case startingSRSStageName = "starting_srs_stage_name"
        case endingSRSStage = "ending_srs_stage"
        case endingSRSStageName = "ending_srs_stage_name"
        case incorrectMeaningAnswers = "incorrect_meaning_answers"
        case incorrectReadingAnswers = "incorrect_reading_answers"
    }
}
