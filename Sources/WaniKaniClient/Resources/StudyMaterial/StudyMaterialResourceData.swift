import Foundation

/// Study material resource data.
public struct StudyMaterialResourceData: Codable, Equatable {
    /// Timestamp when the study material was created.
    public var createdAt: Date
    /// Unique identifier of the associated ``SubjectResource``.
    public var subjectID: Int
    /// The type of the associated ``SubjectResource``.
    public var subjectType: SubjectType
    /// Free form note related to the meaning(s) of the associated subject.
    public var meaningNote: String?
    /// Free form note related to the reading(s) of the associated subject.
    public var readingNote: String?
    /// Synonyms for the meaning of the subject. These are used as additional correct answers during reviews.
    public var meaningSynonyms: [String]
    /// Indicates if the associated subject has been hidden, preventing it from appearing in lessons or reviews.
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
