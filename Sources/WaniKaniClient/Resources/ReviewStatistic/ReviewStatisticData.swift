import Foundation

public struct ReviewStatisticData: Codable, Equatable {
    public let createdAt: Date
    public let subjectID: Int
    public let subjectType: SubjectType
    public let meaningCorrect: Int
    public let meaningIncorrect: Int
    public let meaningMaxStreak: Int
    public let meaningCurrentStreak: Int
    public let readingCorrect: Int
    public let readingIncorrect: Int
    public let readingMaxStreak: Int
    public let readingCurrentStreak: Int
    public let percentageCorrect: Int
    public let isHidden: Bool
    
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

public extension ReviewStatisticData {
    var total: Int {
        get {
            return meaningCorrect + readingCorrect + meaningIncorrect + readingIncorrect
        }
    }
    
    var meaningTotal: Int {
        get {
            return meaningCorrect + meaningIncorrect
        }
    }
    
    var meaningPercentageCorrect: Int {
        get {
            guard meaningTotal != 0 else {
                return 100
            }
            
            return meaningCorrect * 100 / meaningTotal
        }
    }
    
    var readingTotal: Int {
        get {
            return readingCorrect + readingIncorrect
        }
    }
    
    var readingPercentageCorrect: Int {
        get {
            guard readingTotal != 0 else {
                return 100
            }
            
            return readingCorrect * 100 / readingTotal
        }
    }
}
