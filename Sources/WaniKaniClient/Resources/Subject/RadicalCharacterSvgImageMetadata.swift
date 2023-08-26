/// Metadata for images with content type `image/svg+xml`.
public struct RadicalCharacterSvgImageMetadata: Codable, Equatable {
    /// Indicates if the SVG asset contains built-in CSS styling.
    public var inlineStyles: Bool

    public init(inlineStyles: Bool) {
        self.inlineStyles = inlineStyles
    }

    enum CodingKeys: String, CodingKey {
        case inlineStyles = "inline_styles"
    }
}
