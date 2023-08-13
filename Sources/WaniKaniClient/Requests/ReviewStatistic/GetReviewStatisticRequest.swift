import Foundation

/// Retrieves a specific review statistic by its ``ReviewStatisticResource/id``.
public struct GetReviewStatisticRequest {
    /// Unique identifier of the review statistic.
    public var id: Int
    
    public init(id: Int) {
        self.id = id
    }
}

extension GetReviewStatisticRequest: ResourceGetRequest {
    public typealias Resource = ReviewStatisticResource
    
    public var requestURL: URL {
        return ResourceEndpoints.shared.reviewStatistics.appendingPathComponent("\(id)")
    }
}
