/// Indicates how auxiliary meanings should be used when evaluating user input.
public enum AuxiliaryMeaningType: String, Codable, CaseIterable {
    /// Auxiliary meanings are used to match for correctness.
    case whitelist
    /// Auxiliary meanings are used to match for incorrectness.
    case blacklist
}
