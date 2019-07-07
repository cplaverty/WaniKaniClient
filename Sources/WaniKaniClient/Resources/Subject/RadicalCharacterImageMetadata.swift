public struct RadicalCharacterImageMetadata: Codable, Equatable {
    public let color: String?
    public let dimensions: String?
    public let styleName: String?
    public let inlineStyles: Bool?
    
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
