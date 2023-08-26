public enum SubjectResourceDataType: Equatable {
    case radical(RadicalResourceData)
    case kanji(KanjiResourceData)
    case vocabulary(VocabularyResourceData)
    case kanaVocabulary(KanaVocabularyResourceData)
}

extension SubjectResourceDataType: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .radical(let data):
            try container.encode(data)
        case .kanji(let data):
            try container.encode(data)
        case .vocabulary(let data):
            try container.encode(data)
        case .kanaVocabulary(let data):
            try container.encode(data)
        }
    }
}
