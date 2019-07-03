import Foundation

public struct StudyMaterialData: Codable, Equatable {
    public let createdAt: Date
    public let subjectID: Int
    public let subjectType: SubjectType
    public let meaningNote: String?
    public let readingNote: String?
    public let meaningSynonyms: [String]
    public let isHidden: Bool
    
    private enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case subjectID = "subject_id"
        case subjectType = "subject_type"
        case meaningNote = "meaning_note"
        case readingNote = "reading_note"
        case meaningSynonyms = "meaning_synonyms"
        case isHidden = "hidden"
    }
}
