import Foundation

public struct GetAllReviewsRequest {
    public var assignmentIDs: [Int]?
    public var ids: [Int]?
    public var subjectIDs: [Int]?
    public var updatedAfter: Date?
    
    public init(assignmentIDs: [Int]? = nil,
                ids: [Int]? = nil,
                subjectIDs: [Int]? = nil,
                updatedAfter: Date? = nil) {
        self.assignmentIDs = assignmentIDs
        self.ids = ids
        self.subjectIDs = subjectIDs
        self.updatedAfter = updatedAfter
    }
}

extension GetAllReviewsRequest: ResourceCollectionRequest {
    public typealias Resource = ReviewResource
    
    public var requestURL: URL {
        let url = ResourceEndpoints.shared.reviews
        
        var queryItems = [URLQueryItem]()
        queryItems.appendItemsIfSet(name: "assignment_ids", values: assignmentIDs)
        queryItems.appendItemsIfSet(name: "ids", values: ids)
        queryItems.appendItemsIfSet(name: "subject_ids", values: subjectIDs)
        queryItems.appendItemIfSet(name: "updated_after", value: updatedAfter)
        
        guard !queryItems.isEmpty else {
            return url
        }
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = queryItems
        return urlComponents.url!
    }
}
