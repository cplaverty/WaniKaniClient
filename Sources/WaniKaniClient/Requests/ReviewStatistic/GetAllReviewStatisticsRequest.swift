import Foundation

public struct GetAllReviewStatisticsRequest {
    public var isHidden: Bool?
    public var ids: [Int]?
    public var percentagesGreaterThan: Int?
    public var percentagesLessThan: Int?
    public var subjectIDs: [Int]?
    public var subjectTypes: [SubjectType]?
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

extension GetAllReviewStatisticsRequest: ResourceCollectionRequest {
    public typealias Resource = ReviewStatisticResource
    
    public var requestURL: URL {
        let url = ResourceEndpoints.shared.reviewStatistics
        
        var queryItems = [URLQueryItem]()
        queryItems.appendItemIfSet(name: "hidden", value: isHidden)
        queryItems.appendItemsIfSet(name: "ids", values: ids)
        queryItems.appendItemIfSet(name: "percentages_greater_than", value: percentagesGreaterThan)
        queryItems.appendItemIfSet(name: "percentages_less_than", value: percentagesLessThan)
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
