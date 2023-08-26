public enum RadicalCharacterImageMetadataType: Equatable {
    case png(RadicalCharacterPngImageMetadata)
    case svg(RadicalCharacterSvgImageMetadata)
}

extension RadicalCharacterImageMetadataType: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .png(let data):
            try container.encode(data)
        case .svg(let data):
            try container.encode(data)
        }
    }
}
