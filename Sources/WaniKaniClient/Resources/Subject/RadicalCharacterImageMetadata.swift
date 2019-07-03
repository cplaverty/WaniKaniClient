public struct RadicalCharacterImageMetadata: Codable, Equatable {
    public let color: String?
    public let dimensions: String?
    public let styleName: String?
    public let inlineStyles: Bool?
    
    enum CodingKeys: String, CodingKey {
        case color
        case dimensions
        case styleName = "style_name"
        case inlineStyles = "inline_styles"
    }
}
