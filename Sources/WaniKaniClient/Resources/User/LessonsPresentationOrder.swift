public enum LessonsPresentationOrder: String, Codable {
    case ascendingLevelThenSubject = "ascending_level_then_subject"
    case shuffled
    case ascendingLevelThenShuffled = "ascending_level_then_shuffled"
}
