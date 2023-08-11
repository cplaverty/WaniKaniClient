public struct Meaning: Codable, Equatable {
    public var meaning: String
    public var isPrimary: Bool
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
