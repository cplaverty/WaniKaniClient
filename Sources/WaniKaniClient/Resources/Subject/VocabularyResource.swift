import Foundation

public struct VocabularyResource: SubjectTypeData, Codable, Equatable {
    public var createdAt: Date
    public var level: Int
    public var slug: String
    public var hiddenAt: Date?
    public var documentURL: URL
    public var characters: String
    public var meanings: [Meaning]
    public var auxiliaryMeanings: [AuxiliaryMeaning]
    public var readings: [Reading]
    public var partsOfSpeech: [String]
    public var componentSubjectIDs: [Int]
    public var meaningMnemonic: String
    public var readingMnemonic: String
    public var contextSentences: [VocabularyContextSentence]
    public var pronunciationAudios: [VocabularyPronunciationAudio]
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
                partsOfSpeech: [String] = [],
                componentSubjectIDs: [Int] = [],
                meaningMnemonic: String,
                readingMnemonic: String,
                contextSentences: [VocabularyContextSentence] = [],
                pronunciationAudios: [VocabularyPronunciationAudio] = [],
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
        self.partsOfSpeech = partsOfSpeech
        self.componentSubjectIDs = componentSubjectIDs
        self.meaningMnemonic = meaningMnemonic
        self.readingMnemonic = readingMnemonic
        self.contextSentences = contextSentences
        self.pronunciationAudios = pronunciationAudios
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
        case partsOfSpeech = "parts_of_speech"
        case componentSubjectIDs = "component_subject_ids"
        case meaningMnemonic = "meaning_mnemonic"
        case readingMnemonic = "reading_mnemonic"
        case contextSentences = "context_sentences"
        case pronunciationAudios = "pronunciation_audios"
        case lessonPosition = "lesson_position"
    }
}
