import Foundation

public struct VocabularyPronunciationAudio: Codable, Equatable {
    public var url: URL
    public var metadata: VocabularyPronunciationAudioMetadata
    public var contentType: String
    
    public init(url: URL,
                metadata: VocabularyPronunciationAudioMetadata,
                contentType: String) {
        self.url = url
        self.metadata = metadata
        self.contentType = contentType
    }
    
    private enum CodingKeys: String, CodingKey {
        case url
        case metadata
        case contentType = "content_type"
    }
}
