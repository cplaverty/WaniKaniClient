public struct VocabularyContextSentence: Codable, Equatable {
    public let english: String
    public let japanese: String
    
    public init(english: String,
                japanese: String) {
        self.english = english
        self.japanese = japanese
    }
    
    private enum CodingKeys: String, CodingKey {
        case english = "en"
        case japanese = "ja"
    }
}
