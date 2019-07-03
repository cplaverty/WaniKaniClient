public struct VocabularyContextSentence: Codable, Equatable {
    public let english: String
    public let japanese: String
    
    private enum CodingKeys: String, CodingKey {
        case english = "en"
        case japanese = "ja"
    }
}
