import Foundation

private enum KnownImageContentTypes {
    static let png = "image/png"
    static let svg = "image/svg+xml"
}

public struct RadicalCharacterImage: Codable, Equatable {
    /// The location of the image.
    public var url: URL
    /// Details about the image. Each ``contentType`` returns a uniquely structured object.
    public var metadata: RadicalCharacterImageMetadataType
    /// The content type of the image. Currently the API delivers `image/png` and `image/svg+xml`.
    public var contentType: String
    
    public init(url: URL,
                metadata: RadicalCharacterPngImageMetadata) {
        self.url = url
        self.metadata = .png(metadata)
        self.contentType = KnownImageContentTypes.png
    }
    
    public init(url: URL,
                metadata: RadicalCharacterSvgImageMetadata) {
        self.url = url
        self.metadata = .svg(metadata)
        self.contentType = KnownImageContentTypes.svg
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        url = try container.decode(URL.self, forKey: .url)
        contentType = try container.decode(String.self, forKey: .contentType)
        metadata = try container.decodeImageMetadata(forContentType: contentType, forKey: .metadata)
    }
    
    private enum CodingKeys: String, CodingKey {
        case url
        case metadata
        case contentType = "content_type"
    }
}

private extension KeyedDecodingContainerProtocol {
    func decodeImageMetadata(forContentType contentType: String, forKey key: Key) throws -> RadicalCharacterImageMetadataType {
        switch contentType {
        case KnownImageContentTypes.png:
            return .png(try decode(RadicalCharacterPngImageMetadata.self, forKey: key))
        case KnownImageContentTypes.svg:
            return .svg(try decode(RadicalCharacterSvgImageMetadata.self, forKey: key))
        default:
            throw DecodingError.dataCorruptedError(forKey: key, in: self, debugDescription: "Invalid image content type \(contentType)")
        }
    }
}
