import Foundation

/// Study materials store user-specific notes and synonyms for a given subject. The records are created as soon as
/// the user enters any study information.
public struct StudyMaterialResource: WaniKaniResource, Equatable {
    /// Unique identifier of the study material.
    public var id: Int
    /// The kind of object returned.
    public let objectType: ResourceObjectType = .studyMaterial
    /// The URL of the request.
    public var url: URL
    /// The last time that particular resource was updated.
    public var dataUpdatedAt: Date
    public var data: StudyMaterialResourceData
    
    public init(id: Int,
                url: URL,
                dataUpdatedAt: Date,
                data: StudyMaterialResourceData) {
        self.id = id
        self.url = url
        self.dataUpdatedAt = dataUpdatedAt
        self.data = data
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case objectType = "object"
        case url
        case dataUpdatedAt = "data_updated_at"
        case data
    }
}
