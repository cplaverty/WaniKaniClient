public struct KanjiReading: Codable, Equatable {
    /// The kanji reading's classfication.
    public var type: ReadingType
    /// A singular subject reading.
    public var reading: String
    /// Indicates priority in the WaniKani system.
    public var isPrimary: Bool
    /// Indicates if the reading is used to evaluate user input for correctness.
    public var isAcceptedAnswer: Bool
    
    public init(type: ReadingType,
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
