import Foundation

/// Retrieves a specific study material by its ``StudyMaterialResource/id``.
public struct GetStudyMaterialRequest {
    /// Unique identifier of the study material.
    public var id: Int
    
    public init(id: Int) {
        self.id = id
    }
}

extension GetStudyMaterialRequest: ResourceGetRequest {
    public typealias Resource = StudyMaterialResource
    
    public var requestURL: URL {
        return ResourceEndpoints.shared.studyMaterials.appendingPathComponent("\(id)")
    }
}
