import Foundation

public struct KanjiResource: SubjectTypeData, Codable, Equatable {
    public let createdAt: Date
    public let level: Int
    public let slug: String
    public let hiddenAt: Date?
    public let documentURL: URL
    public let characters: String
    public let meanings: [Meaning]
    public let auxiliaryMeanings: [AuxiliaryMeaning]
    public let readings: [Reading]
    public let componentSubjectIDs: [Int]
    public let amalgamationSubjectIDs: [Int]
    public let visuallySimilarSubjectIDs: [Int]
    public let meaningMnemonic: String
    public let meaningHint: String?
    public let readingMnemonic: String
    public let readingHint: String?
    public let lessonPosition: Int
    
    public init(createdAt: Date,
                level: Int,
                slug: String,
                hiddenAt: Date? = nil,
                documentURL: URL,
                characters: String,
                meanings: [Meaning],
                auxiliaryMeanings: [AuxiliaryMeaning] = [],
                readings: [Reading],
                componentSubjectIDs: [Int] = [],
                amalgamationSubjectIDs: [Int] = [],
                visuallySimilarSubjectIDs: [Int] = [],
                meaningMnemonic: String,
                meaningHint: String? = nil,
                readingMnemonic: String,
                readingHint: String? = nil,
                lessonPosition: Int) {
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
    }
}
