import Foundation

/// Returns a collection of all reviews, ordered by ascending ``ReviewResourceData/createdAt``, 1000 at a time.
public struct GetAllReviewsRequest {
    /// Only reviews where ``ReviewResourceData/assignmentID`` matches one of the array values are returned.
    public var assignmentIDs: [Int]?
    /// Only reviews where ``ReviewResource/id`` matches one of the array values are returned.
    public var ids: [Int]?
    /// Only reviews where ``ReviewResourceData/subjectID`` matches one of the array values are returned.
    public var subjectIDs: [Int]?
    /// Only reviews updated after this time are returned.
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

extension GetAllReviewsRequest: ResourceCollectionGetRequest {
    public typealias Resource = ReviewResource
    
    public var url: URL {
        let url = ResourceEndpoints.shared.reviews
        
        var queryItems = [URLQueryItem]()
        queryItems.appendIfSet(name: "assignment_ids", values: assignmentIDs)
        queryItems.appendIfSet(name: "ids", values: ids)
        queryItems.appendIfSet(name: "subject_ids", values: subjectIDs)
        queryItems.appendIfSet(name: "updated_after", date: updatedAfter)
        
        guard !queryItems.isEmpty else {
            return url
        }
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = queryItems
        return urlComponents.url!
    }
}
