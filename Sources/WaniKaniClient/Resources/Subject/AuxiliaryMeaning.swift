public struct AuxiliaryMeaning: Codable, Equatable {
    public var type: AuxiliaryMeaningType
    public var meaning: String
    
    public init(type: AuxiliaryMeaningType,
                meaning: String) {
        self.type = type
        self.meaning = meaning
    }
    
    private enum CodingKeys: String, CodingKey {
        case type
        case meaning
    }
}
