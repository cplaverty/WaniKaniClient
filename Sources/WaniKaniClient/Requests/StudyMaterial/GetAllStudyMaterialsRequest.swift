import Foundation

public struct GetAllStudyMaterialsRequest {
    public var isHidden: Bool?
    public var ids: [Int]?
    public var subjectIDs: [Int]?
    public var subjectTypes: [SubjectType]?
    public var updatedAfter: Date?
    
    public init(isHidden: Bool? = nil,
                ids: [Int]? = nil,
                subjectIDs: [Int]? = nil,
                subjectTypes: [SubjectType]? = nil,
                updatedAfter: Date? = nil) {
        self.isHidden = isHidden
        self.ids = ids
        self.subjectIDs = subjectIDs
        self.subjectTypes = subjectTypes
        self.updatedAfter = updatedAfter
    }
}

extension GetAllStudyMaterialsRequest: ResourceCollectionRequest {
    public typealias Resource = StudyMaterialResource
    
    public var requestURL: URL {
        let url = ResourceEndpoints.shared.studyMaterials
        
        var queryItems = [URLQueryItem]()
        queryItems.appendItemIfSet(name: "hidden", value: isHidden)
        queryItems.appendItemsIfSet(name: "ids", values: ids)
        queryItems.appendItemsIfSet(name: "subject_ids", values: subjectIDs)
        queryItems.appendItemsIfSet(name: "subject_types", values: subjectTypes)
        queryItems.appendItemIfSet(name: "updated_after", value: updatedAfter)
        
        guard !queryItems.isEmpty else {
            return url
        }
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = queryItems
        return urlComponents.url!
    }
}
