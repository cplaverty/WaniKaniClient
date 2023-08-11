import Foundation

public struct ReviewResourceData: Codable, Equatable {
    public var createdAt: Date
    public var assignmentID: Int
    public var subjectID: Int
    public var startingSRSStage: Int
    public var startingSRSStageName: String
    public var endingSRSStage: Int
    public var endingSRSStageName: String
    public var incorrectMeaningAnswers: Int
    public var incorrectReadingAnswers: Int
    
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
