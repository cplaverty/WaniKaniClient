import Foundation

public struct KanjiResource: SubjectTypeData, Codable, Equatable {
    public var createdAt: Date
    public var level: Int
    public var slug: String
    public var hiddenAt: Date?
    public var documentURL: URL
    public var characters: String
    public var meanings: [Meaning]
    public var auxiliaryMeanings: [AuxiliaryMeaning]
    public var readings: [Reading]
    public var componentSubjectIDs: [Int]
    public var amalgamationSubjectIDs: [Int]
    public var visuallySimilarSubjectIDs: [Int]
    public var meaningMnemonic: String
    public var meaningHint: String?
    public var readingMnemonic: String
    public var readingHint: String?
    public var lessonPosition: Int
    
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
