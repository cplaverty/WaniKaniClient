public struct AuxiliaryMeaning: Codable, Equatable {
    /// Indicates how ``meaning`` should be used when evaluating user input.
    public var type: AuxiliaryMeaningType
    /// A singular subject meaning.
    public var meaning: String
    
    public init(type: AuxiliaryMeaningType,
                meaning: String) {
        self.type = type
        self.meaning = meaning
    }
}
