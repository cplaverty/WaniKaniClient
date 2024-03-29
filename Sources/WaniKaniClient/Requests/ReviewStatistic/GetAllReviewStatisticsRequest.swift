import Foundation

/// Returns a collection of all review statistics, ordered by ascending ``ReviewStatisticResourceData/createdAt``,
/// 500 at a time.
public struct GetAllReviewStatisticsRequest {
    /// Return review statistics with a matching value in ``ReviewStatisticResourceData/isHidden``.
    public var isHidden: Bool?
    /// Only review statistics where ``ReviewStatisticResource/id`` matches one of the array values are returned.
    public var ids: [Int]?
    /// Return review statistics where the ``ReviewStatisticResourceData/percentageCorrect`` is greater than the value.
    public var percentagesGreaterThan: Int?
    /// Return review statistics where the ``ReviewStatisticResourceData/percentageCorrect`` is less than the value.
    public var percentagesLessThan: Int?
    /// Only review statistics where ``ReviewStatisticResourceData/subjectID`` matches one of the array values are returned.
    public var subjectIDs: [Int]?
    /// Only review statistics where ``ReviewStatisticResourceData/subjectType`` matches one of the array values are returned.
    public var subjectTypes: [SubjectType]?
    /// Only review statistics updated after this time are returned.
    public var updatedAfter: Date?
    
    public init(isHidden: Bool? = nil,
                ids: [Int]? = nil,
                percentagesGreaterThan: Int? = nil,
                percentagesLessThan: Int? = nil,
                subjectIDs: [Int]? = nil,
                subjectTypes: [SubjectType]? = nil,
                updatedAfter: Date? = nil) {
        self.isHidden = isHidden
        self.ids = ids
        self.percentagesGreaterThan = percentagesGreaterThan
        self.percentagesLessThan = percentagesLessThan
        self.subjectIDs = subjectIDs
        self.subjectTypes = subjectTypes
        self.updatedAfter = updatedAfter
    }
}

extension GetAllReviewStatisticsRequest: ResourceCollectionGetRequest {
    public typealias Resource = ReviewStatisticResource
    
    public var url: URL {
        let url = ResourceEndpoints.shared.reviewStatistics
        
        var queryItems = [URLQueryItem]()
        queryItems.appendIfSet(name: "hidden", value: isHidden)
        queryItems.appendIfSet(name: "ids", values: ids)
        queryItems.appendIfSet(name: "percentages_greater_than", value: percentagesGreaterThan)
        queryItems.appendIfSet(name: "percentages_less_than", value: percentagesLessThan)
        queryItems.appendIfSet(name: "subject_ids", values: subjectIDs)
        queryItems.appendIfSet(name: "subject_types", values: subjectTypes)
        queryItems.appendIfSet(name: "updated_after", date: updatedAfter)
        
        guard !queryItems.isEmpty else {
            return url
        }
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = queryItems
        return urlComponents.url!
    }
}
