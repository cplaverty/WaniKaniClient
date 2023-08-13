public struct VocabularyReading: Codable, Equatable {
    /// A singular subject reading.
    public var reading: String
    /// Indicates priority in the WaniKani system.
    public var isPrimary: Bool
    /// Indicates if the reading is used to evaluate user input for correctness.
    public var isAcceptedAnswer: Bool
    
    public init(reading: String,
                isPrimary: Bool,
                isAcceptedAnswer: Bool) {
        self.reading = reading
        self.isPrimary = isPrimary
        self.isAcceptedAnswer = isAcceptedAnswer
    }
    
    private enum CodingKeys: String, CodingKey {
        case reading
        case isPrimary = "primary"
        case isAcceptedAnswer = "accepted_answer"
    }
}
