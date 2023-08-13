import Foundation

public struct RadicalResourceData: SubjectResourceData, Codable, Equatable {
    /// Timestamp when the subject was created.
    public var createdAt: Date
    /// The level of the subject, from 1 to 60.
    public var level: Int
    /// The string that is used when generating the document URL for the subject. Radicals use their meaning, lowercased.
    public var slug: String
    /// Timestamp when the subject was hidden, indicating associated assignments will no longer appear in
    /// lessons or reviews and that the subject page is no longer visible on wanikani.com.
    public var hiddenAt: Date?
    /// The page on wanikani.com that provides detailed information about this subject.
    public var documentURL: URL
    /// The characters for the subject. Not all radicals have a Unicode entry, so the radical must be visually
    /// represented with an image instead.
    public var characters: String?
    /// A collection of images of the radical.
    public var characterImages: [RadicalCharacterImage]
    /// The subject meanings.
    public var meanings: [Meaning]
    /// Collection of auxiliary meanings.
    public var auxiliaryMeanings: [AuxiliaryMeaning]
    /// The unique identifiers for the kanji that have the radical as a component.
    public var amalgamationSubjectIDs: [Int]
    /// The subject's meaning mnemonic.
    public var meaningMnemonic: String
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
                characters: String? = nil,
                characterImages: [RadicalCharacterImage] = [],
                meanings: [Meaning],
                auxiliaryMeanings: [AuxiliaryMeaning] = [],
                amalgamationSubjectIDs: [Int] = [],
                meaningMnemonic: String,
                lessonPosition: Int,
                spacedRepetitionSystemID: Int) {
        self.createdAt = createdAt
        self.level = level
        self.slug = slug
        self.hiddenAt = hiddenAt
        self.documentURL = documentURL
        self.characters = characters
        self.characterImages = characterImages
        self.meanings = meanings
        self.auxiliaryMeanings = auxiliaryMeanings
        self.amalgamationSubjectIDs = amalgamationSubjectIDs
        self.meaningMnemonic = meaningMnemonic
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
        case characterImages = "character_images"
        case meanings
        case auxiliaryMeanings = "auxiliary_meanings"
        case amalgamationSubjectIDs = "amalgamation_subject_ids"
        case meaningMnemonic = "meaning_mnemonic"
        case lessonPosition = "lesson_position"
        case spacedRepetitionSystemID = "spaced_repetition_system_id"
    }
}
