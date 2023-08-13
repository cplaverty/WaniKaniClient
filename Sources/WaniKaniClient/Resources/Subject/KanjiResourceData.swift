import Foundation

public struct KanjiResourceData: SubjectResourceData, Codable, Equatable {
    /// Timestamp when the subject was created.
    public var createdAt: Date
    /// The level of the subject, from 1 to 60.
    public var level: Int
    /// The string that is used when generating the document URL for the subject. Kanji use their characters.
    public var slug: String
    /// Timestamp when the subject was hidden, indicating associated assignments will no longer appear in
    /// lessons or reviews and that the subject page is no longer visible on wanikani.com.
    public var hiddenAt: Date?
    /// The page on wanikani.com that provides detailed information about this subject.
    public var documentURL: URL
    /// The characters for the subject, including kanji and hiragana.
    public var characters: String
    /// The subject meanings.
    public var meanings: [Meaning]
    /// Collection of auxiliary meanings.
    public var auxiliaryMeanings: [AuxiliaryMeaning]
    /// Selected readings for the kanji.
    public var readings: [KanjiReading]
    /// The unique identifiers for the radicals that make up this kanji.
    ///
    /// These are the subjects that must have passed assignments in order to unlock this subject's assignment.
    public var componentSubjectIDs: [Int]
    /// The unique identifiers for the vocabulary that have the kanji as a component.
    public var amalgamationSubjectIDs: [Int]
    /// The unique identifiers for the kanji which are visually similar to the kanji.
    public var visuallySimilarSubjectIDs: [Int]
    /// The subject's meaning mnemonic.
    public var meaningMnemonic: String
    /// Meaning hint for the kanji.
    public var meaningHint: String?
    /// The kanji's reading mnemonic.
    public var readingMnemonic: String
    /// Reading hint for the kanji.
    public var readingHint: String?
    /// The position that the subject appears in lessons. Note that the value is scoped to the level of the
    /// subject, so there are duplicate values across levels.
    public var lessonPosition: Int
    /// Unique identifier of the associated ``SpacedRepetitionSystemResource``.
    public var spacedRepetitionSystemID: Int

    public init(createdAt: Date,
                level: Int,
                slug: String,
                hiddenAt: Date? = nil,
                documentURL: URL,
                characters: String,
                meanings: [Meaning],
                auxiliaryMeanings: [AuxiliaryMeaning] = [],
                readings: [KanjiReading],
                componentSubjectIDs: [Int] = [],
                amalgamationSubjectIDs: [Int] = [],
                visuallySimilarSubjectIDs: [Int] = [],
                meaningMnemonic: String,
                meaningHint: String? = nil,
                readingMnemonic: String,
                readingHint: String? = nil,
                lessonPosition: Int,
                spacedRepetitionSystemID: Int) {
        self.createdAt = createdAt
        self.level = level
        self.slug = slug
        self.hiddenAt = hiddenAt
        self.documentURL = documentURL
        self.characters = characters
        self.meanings = meanings
        self.auxiliaryMeanings = auxiliaryMeanings
        self.readings = readings
        self.componentSubjectIDs = componentSubjectIDs
        self.amalgamationSubjectIDs = amalgamationSubjectIDs
        self.visuallySimilarSubjectIDs = visuallySimilarSubjectIDs
        self.meaningMnemonic = meaningMnemonic
        self.meaningHint = meaningHint
        self.readingMnemonic = readingMnemonic
        self.readingHint = readingHint
        self.lessonPosition = lessonPosition
        self.spacedRepetitionSystemID = spacedRepetitionSystemID
    }
    
    private enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case level
        case slug
        case hiddenAt = "hidden_at"
        case documentURL = "document_url"
        case characters
        case meanings
        case auxiliaryMeanings = "auxiliary_meanings"
        case readings
        case componentSubjectIDs = "component_subject_ids"
        case amalgamationSubjectIDs = "amalgamation_subject_ids"
        case visuallySimilarSubjectIDs = "visually_similar_subject_ids"
        case meaningMnemonic = "meaning_mnemonic"
        case meaningHint = "meaning_hint"
        case readingMnemonic = "reading_mnemonic"
        case readingHint = "reading_hint"
        case lessonPosition = "lesson_position"
        case spacedRepetitionSystemID = "spaced_repetition_system_id"
    }
}
