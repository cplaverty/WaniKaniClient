import Foundation

public struct StudyMaterialResource: Codable, Equatable {
    public var id: Int
    public let objectType: ResourceObjectType = .studyMaterial
    public var url: URL
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
