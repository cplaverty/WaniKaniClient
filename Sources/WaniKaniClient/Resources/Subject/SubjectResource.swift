import Foundation

/// Subjects are the radicals, kanji, vocabulary, and kana vocabulary that are learned through lessons and reviews.
/// They contain basic dictionary information, such as meanings and/or readings, and information about their
/// relationship to other items with WaniKani, like their level.
public struct SubjectResource: WaniKaniResource {
    /// Unique identifier of the subject.
    public var id: Int
    /// The kind of object returned.
    public private(set) var objectType: ResourceObjectType
    /// The URL of the request.
    public var url: URL
    /// The last time that particular resource was updated.
    public var dataUpdatedAt: Date
    public private(set) var data: SubjectResourceDataType
    
    public init(id: Int, url: URL, dataUpdatedAt: Date, data: RadicalResourceData) {
        self.id = id
        self.objectType = .radical
        self.url = url
        self.dataUpdatedAt = dataUpdatedAt
        self.data = .radical(data)
    }
    
    public init(id: Int, url: URL, dataUpdatedAt: Date, data: KanjiResourceData) {
        self.id = id
        self.objectType = .kanji
        self.url = url
        self.dataUpdatedAt = dataUpdatedAt
        self.data = .kanji(data)
    }
    
    public init(id: Int, url: URL, dataUpdatedAt: Date, data: VocabularyResourceData) {
        self.id = id
        self.objectType = .vocabulary
        self.url = url
        self.dataUpdatedAt = dataUpdatedAt
        self.data = .vocabulary(data)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        objectType = try container.decode(ResourceObjectType.self, forKey: .objectType)
        url = try container.decode(URL.self, forKey: .url)
        dataUpdatedAt = try container.decode(Date.self, forKey: .dataUpdatedAt)
        data = try container.decodeResource(of: objectType, forKey: .data)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(objectType, forKey: .objectType)
        try container.encode(url, forKey: .url)
        try container.encode(dataUpdatedAt, forKey: .dataUpdatedAt)
        switch data {
        case let .radical(r):
            try container.encode(r, forKey: .data)
        case let .kanji(k):
            try container.encode(k, forKey: .data)
        case let .vocabulary(v):
            try container.encode(v, forKey: .data)
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case objectType = "object"
        case url
        case dataUpdatedAt = "data_updated_at"
        case data
    }
}

private extension KeyedDecodingContainerProtocol {
    func decodeResource(of type: ResourceObjectType, forKey key: Key) throws -> SubjectResourceDataType {
        switch type {
        case .radical:
            return .radical(try decode(RadicalResourceData.self, forKey: key))
        case .kanji:
            return .kanji(try decode(KanjiResourceData.self, forKey: key))
        case .vocabulary:
            return .vocabulary(try decode(VocabularyResourceData.self, forKey: key))
        default:
            throw DecodingError.dataCorruptedError(forKey: key, in: self, debugDescription: "Invalid subject type \(type)")
        }
    }
}
