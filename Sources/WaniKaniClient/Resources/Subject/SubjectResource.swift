import Foundation

/// Subjects are the radicals, kanji, vocabulary, and kana vocabulary that are learned through lessons and reviews.
/// They contain basic dictionary information, such as meanings and/or readings, and information about their
/// relationship to other items with WaniKani, like their level.
public struct SubjectResource: WaniKaniResource {
    /// Mapping of ``ResourceObjectType`` to the type of the DTO
    public static var knownResources: [ResourceObjectType: any SubjectResourceData.Type] = [
        .radical: RadicalResourceData.self,
        .kanji: KanjiResourceData.self,
        .vocabulary: VocabularyResourceData.self,
        .kanaVocabulary: KanaVocabularyResourceData.self
    ]
    
    /// Unique identifier of the subject.
    public var id: Int
    /// The kind of object returned.
    public var objectType: ResourceObjectType
    /// The URL of the request.
    public var url: URL
    /// The last time that particular resource was updated.
    public var dataUpdatedAt: Date
    public var data: any SubjectResourceData
    
    public init(id: Int,
                objectType: ResourceObjectType,
                url: URL,
                dataUpdatedAt: Date,
                data: any SubjectResourceData) {
        self.id = id
        self.objectType = objectType
        self.url = url
        self.dataUpdatedAt = dataUpdatedAt
        self.data = data
    }
    
    public init(id: Int, url: URL, dataUpdatedAt: Date, data: RadicalResourceData) {
        self.init(id: id, objectType: .radical, url: url, dataUpdatedAt: dataUpdatedAt, data: data)
    }
    
    public init(id: Int, url: URL, dataUpdatedAt: Date, data: KanjiResourceData) {
        self.init(id: id, objectType: .kanji, url: url, dataUpdatedAt: dataUpdatedAt, data: data)
    }
    
    public init(id: Int, url: URL, dataUpdatedAt: Date, data: VocabularyResourceData) {
        self.init(id: id, objectType: .vocabulary, url: url, dataUpdatedAt: dataUpdatedAt, data: data)
    }
    
    public init(id: Int, url: URL, dataUpdatedAt: Date, data: KanaVocabularyResourceData) {
        self.init(id: id, objectType: .kanaVocabulary, url: url, dataUpdatedAt: dataUpdatedAt, data: data)
    }
}

// MARK: - Codable

extension SubjectResource: Codable {
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
        try container.encode(data, forKey: .data)
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case objectType = "object"
        case url
        case dataUpdatedAt = "data_updated_at"
        case data
    }
}

// MARK: - Equatable

extension SubjectResource: Equatable {
    public static func == (lhs: SubjectResource, rhs: SubjectResource) -> Bool {
        return lhs.id == rhs.id
        && lhs.objectType == rhs.objectType
        && lhs.url == rhs.url
        && lhs.dataUpdatedAt == rhs.dataUpdatedAt
        && lhs.data.isEqual(to: rhs.data)
    }
}

private extension KeyedDecodingContainerProtocol {
    func decodeResource(of objectType: ResourceObjectType, forKey key: Key) throws -> any SubjectResourceData {
        guard let type = SubjectResource.knownResources[objectType] else {
            throw DecodingError.dataCorruptedError(forKey: key, in: self, debugDescription: "Unknown subject type \(objectType)")
        }
        
        return try decode(type, forKey: key)
    }
}
