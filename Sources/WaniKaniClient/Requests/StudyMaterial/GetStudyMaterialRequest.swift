import Foundation

public struct GetStudyMaterialRequest {
    public var id: Int
    
    public init(id: Int) {
        self.id = id
    }
}

extension GetStudyMaterialRequest: ResourceRequest {
    public typealias Resource = StudyMaterialResource
    
    public var requestURL: URL {
        return ResourceEndpoints.shared.studyMaterials.appendingPathComponent("\(id)")
    }
}
