import Foundation

public struct StudyMaterial: Codable, Equatable {
    public let id: Int
    public let objectType: ResourceObjectType = .studyMaterial
    public let url: URL
    public let dataUpdatedAt: Date
    public let data: StudyMaterialData
    
    private enum CodingKeys: String, CodingKey {
        case id
        case objectType = "object"
        case url
        case dataUpdatedAt = "data_updated_at"
        case data
    }
}
