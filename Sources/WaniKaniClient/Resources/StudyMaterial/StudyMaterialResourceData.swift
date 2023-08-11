import Foundation

public struct StudyMaterialResourceData: Codable, Equatable {
    public var createdAt: Date
    public var subjectID: Int
    public var subjectType: SubjectType
    public var meaningNote: String?
    public var readingNote: String?
    public var meaningSynonyms: [String]
    public var isHidden: Bool
    
    public init(createdAt: Date,
                subjectID: Int,
                subjectType: SubjectType,
                meaningNote: String? = nil,
                readingNote: String? = nil,
                meaningSynonyms: [String] = [],
                isHidden: Bool) {
        self.createdAt = createdAt
        self.subjectID = subjectID
        self.subjectType = subjectType
        self.meaningNote = meaningNote
        self.readingNote = readingNote
        self.meaningSynonyms = meaningSynonyms
        self.isHidden = isHidden
    }
    
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
