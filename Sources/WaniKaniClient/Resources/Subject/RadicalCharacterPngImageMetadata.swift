/// Metadata for images with content type `image/png`.
public struct RadicalCharacterPngImageMetadata: RadicalCharacterImageMetadata {
    /// Color of the asset in hexadecimal.
    public var color: String
    /// Dimension of the asset in pixels.
    public var dimensions: String
    /// A name descriptor.
    public var styleName: String

    public init(color: String,
                dimensions: String,
                styleName: String) {
        self.color = color
        self.dimensions = dimensions
        self.styleName = styleName
    }

    enum CodingKeys: String, CodingKey {
        case color
        case dimensions
        case styleName = "style_name"
    }
}
