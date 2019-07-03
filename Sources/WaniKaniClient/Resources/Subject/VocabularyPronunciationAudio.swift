import Foundation

public struct VocabularyPronunciationAudio: Codable, Equatable {
    public let url: URL
    public let metadata: VocabularyPronunciationAudioMetadata
    public let contentType: String
    
    private enum CodingKeys: String, CodingKey {
        case url
        case metadata
        case contentType = "content_type"
    }
}
