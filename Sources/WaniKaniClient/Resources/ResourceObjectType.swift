import Foundation

public enum ResourceObjectType: String, Codable {
    case collection
    
    // Singular resources
    case assignment
    case kanaVocabulary = "kana_vocabulary"
    case kanji
    case levelProgression = "level_progression"
    case radical
    case reset
    case review
    case reviewStatistic = "review_statistic"
    case spacedRepetitionSystem = "spaced_repetition_system"
    case studyMaterial = "study_material"
    case user
    case vocabulary
    case voiceActor = "voice_actor"
    
    case unknown
}
