public struct Meaning: Codable, Equatable {
    /// A singular subject meaning.
    public var meaning: String
    /// Indicates priority in the WaniKani system.
    public var isPrimary: Bool
    /// Indicates if the meaning is used to evaluate user input for correctness.
    public var isAcceptedAnswer: Bool
    
    public init(meaning: String,
                isPrimary: Bool,
                isAcceptedAnswer: Bool) {
        self.meaning = meaning
        self.isPrimary = isPrimary
        self.isAcceptedAnswer = isAcceptedAnswer
    }
    
    private enum CodingKeys: String, CodingKey {
        case meaning
        case isPrimary = "primary"
        case isAcceptedAnswer = "accepted_answer"
    }
}
