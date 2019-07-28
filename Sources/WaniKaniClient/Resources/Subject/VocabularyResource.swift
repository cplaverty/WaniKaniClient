import Foundation

public struct VocabularyResource: SubjectTypeData, Codable, Equatable {
    public let createdAt: Date
    public let level: Int
    public let slug: String
    public let hiddenAt: Date?
    public let documentURL: URL
    public let characters: String
    public let meanings: [Meaning]
    public let auxiliaryMeanings: [AuxiliaryMeaning]
    public let readings: [Reading]
    public let partsOfSpeech: [String]
    public let componentSubjectIDs: [Int]
    public let meaningMnemonic: String
    public let readingMnemonic: String
    public let contextSentences: [VocabularyContextSentence]
    public let pronunciationAudios: [VocabularyPronunciationAudio]
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
