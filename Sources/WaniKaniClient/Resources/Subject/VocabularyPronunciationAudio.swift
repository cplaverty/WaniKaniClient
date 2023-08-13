import Foundation

public struct VocabularyPronunciationAudio: Codable, Equatable {
    /// The location of the audio.
    public var url: URL
    /// Details about the pronunciation audio.
    public var metadata: VocabularyPronunciationAudioMetadata
    /// The content type of the audio. Currently the API delivers `audio/mpeg` and `audio/ogg`.
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
