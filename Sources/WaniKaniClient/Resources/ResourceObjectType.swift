import Foundation

public enum ResourceObjectType: String, Codable {
    case assignment
    case kanji
    case levelProgression = "level_progression"
    case radical
    case reset
    case review
    case reviewStatistic = "review_statistic"
    case studyMaterial = "study_material"
    case user
    case vocabulary
}
