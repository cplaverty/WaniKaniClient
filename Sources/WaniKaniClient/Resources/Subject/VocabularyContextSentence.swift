public struct VocabularyContextSentence: Codable, Equatable {
    public var english: String
    public var japanese: String
    
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
