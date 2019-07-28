import Foundation

public struct RadicalResource: SubjectTypeData, Codable, Equatable {
    public let createdAt: Date
    public let level: Int
    public let slug: String
    public let hiddenAt: Date?
    public let documentURL: URL
    public let characters: String?
    public let characterImages: [RadicalCharacterImage]
    public let meanings: [Meaning]
    public let auxiliaryMeanings: [AuxiliaryMeaning]
    public let amalgamationSubjectIDs: [Int]
    public let meaningMnemonic: String
    public let lessonPosition: Int
    
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
                lessonPosition: Int) {
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
    }
}
