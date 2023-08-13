import Foundation

/// Returns a collection of all study material, ordered by ascending ``StudyMaterialResourceData/createdAt``, 500 at a time.
public struct GetAllStudyMaterialsRequest {
    /// Return study materials with a matching value in ``StudyMaterialResourceData/isHidden``.
    public var isHidden: Bool?
    /// Only study material records where ``StudyMaterialResource/id`` matches one of the array values are returned.
    public var ids: [Int]?
    /// Only study material records where ``StudyMaterialResourceData/subjectID`` matches one of the array values are returned.
    public var subjectIDs: [Int]?
    /// Only study material records where ``StudyMaterialResourceData/subjectType`` matches one of the array values are returned.
    public var subjectTypes: [SubjectType]?
    /// Only study material records updated after this time are returned.
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
