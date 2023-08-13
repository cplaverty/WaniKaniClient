import Foundation

public struct RadicalCharacterImage: Codable, Equatable {
    /// The location of the image.
    public var url: URL
    /// Details about the image. Each ``contentType`` returns a uniquely structured object.
    public var metadata: RadicalCharacterImageMetadata
    /// The content type of the image. Currently the API delivers `image/png` and `image/svg+xml`.
    public var contentType: String
    
    public init(url: URL,
                metadata: RadicalCharacterImageMetadata,
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
