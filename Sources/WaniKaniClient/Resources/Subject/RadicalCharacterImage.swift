import Foundation

private enum KnownImageContentTypes {
    static let png = "image/png"
    static let svg = "image/svg+xml"
}

public struct RadicalCharacterImage {
    /// Mapping of radical image content type (e.g. `image/png`) to the type of the metadata DTO
    public static var knownImageContentTypes: [String: any RadicalCharacterImageMetadata.Type] = [
        KnownImageContentTypes.png: RadicalCharacterPngImageMetadata.self,
        KnownImageContentTypes.svg: RadicalCharacterSvgImageMetadata.self,
    ]
    
    /// The location of the image.
    public var url: URL
    /// Details about the image. Each ``contentType`` returns a uniquely structured object.
    public var metadata: any RadicalCharacterImageMetadata
    /// The content type of the image. Currently the API delivers `image/png` and `image/svg+xml`.
    public var contentType: String
    
    public init(url: URL,
                metadata: any RadicalCharacterImageMetadata,
                contentType: String) {
        self.url = url
        self.metadata = metadata
        self.contentType = contentType
    }
    
    public init(url: URL, metadata: RadicalCharacterPngImageMetadata) {
        self.init(url: url, metadata: metadata, contentType: KnownImageContentTypes.png)
    }
    
    public init(url: URL, metadata: RadicalCharacterSvgImageMetadata) {
        self.init(url: url, metadata: metadata, contentType: KnownImageContentTypes.svg)
    }
}

// MARK: - Codable

extension RadicalCharacterImage: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        url = try container.decode(URL.self, forKey: .url)
        contentType = try container.decode(String.self, forKey: .contentType)
        metadata = try container.decodeImageMetadata(forContentType: contentType, forKey: .metadata)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(url, forKey: .url)
        try container.encode(metadata, forKey: .metadata)
        try container.encode(contentType, forKey: .contentType)
    }
    
    private enum CodingKeys: String, CodingKey {
        case url
        case metadata
        case contentType = "content_type"
    }
}

// MARK: - Equatable

extension RadicalCharacterImage: Equatable {
    public static func == (lhs: RadicalCharacterImage, rhs: RadicalCharacterImage) -> Bool {
        return lhs.url == rhs.url
        && lhs.metadata.isEqual(to: rhs.metadata)
        && lhs.contentType == rhs.contentType
    }
}

private extension KeyedDecodingContainerProtocol {
    func decodeImageMetadata(forContentType contentType: String, forKey key: Key) throws -> any RadicalCharacterImageMetadata {
        guard let type = RadicalCharacterImage.knownImageContentTypes[contentType] else {
            throw DecodingError.dataCorruptedError(forKey: key, in: self, debugDescription: "Unknown image content type \(contentType)")
        }
        
        return try decode(type, forKey: key)
    }
}
