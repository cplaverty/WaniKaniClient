public struct VocabularyContextSentence: Codable, Equatable {
    /// English translation of the sentence.
    public var english: String
    /// Japanese context sentence.
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
