/// The order in which reviews are presented.
public enum ReviewsPresentationOrder: String, Codable, CaseIterable {
    case shuffled
    case lowerLevelsFirst = "lower_levels_first"
}
