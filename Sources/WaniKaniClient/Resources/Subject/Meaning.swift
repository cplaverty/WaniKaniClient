public struct Meaning: Codable, Equatable {
    public let meaning: String
    public let isPrimary: Bool
    public let isAcceptedAnswer: Bool
    
    private enum CodingKeys: String, CodingKey {
        case meaning
        case isPrimary = "primary"
        case isAcceptedAnswer = "accepted_answer"
    }
}
