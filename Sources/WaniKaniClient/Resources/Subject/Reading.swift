public struct Reading: Codable, Equatable {
    /// Kanji only
    public var type: ReadingType?
    public var reading: String
    public var isPrimary: Bool
    public var isAcceptedAnswer: Bool
    
    public init(type: ReadingType? = nil,
                reading: String,
                isPrimary: Bool,
                isAcceptedAnswer: Bool) {
        self.type = type
        self.reading = reading
        self.isPrimary = isPrimary
        self.isAcceptedAnswer = isAcceptedAnswer
    }
    
    private enum CodingKeys: String, CodingKey {
        case type
        case reading
        case isPrimary = "primary"
        case isAcceptedAnswer = "accepted_answer"
    }
}
