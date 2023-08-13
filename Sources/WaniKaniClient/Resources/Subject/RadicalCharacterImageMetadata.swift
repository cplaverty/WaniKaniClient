public struct RadicalCharacterImageMetadata: Codable, Equatable {
    /// Color of the asset in hexadecimal.
    public var color: String?
    /// Dimension of the asset in pixels.
    public var dimensions: String?
    /// A name descriptor.
    public var styleName: String?
    /// Indicates if the SVG asset contains built-in CSS styling.
    public var inlineStyles: Bool?
    
    public init(color: String? = nil,
                dimensions: String? = nil,
                styleName: String? = nil,
                inlineStyles: Bool? = nil) {
        self.color = color
        self.dimensions = dimensions
        self.styleName = styleName
        self.inlineStyles = inlineStyles
    }
    
    enum CodingKeys: String, CodingKey {
        case color
        case dimensions
        case styleName = "style_name"
        case inlineStyles = "inline_styles"
    }
}
