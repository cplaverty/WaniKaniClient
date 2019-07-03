public struct AuxiliaryMeaning: Codable, Equatable {
    public let type: AuxiliaryMeaningType
    public let meaning: String
    
    private enum CodingKeys: String, CodingKey {
        case type
        case meaning
    }
}
