import Foundation

public struct GetReviewStatisticRequest {
    public var id: Int
    
    public init(id: Int) {
        self.id = id
    }
}

extension GetReviewStatisticRequest: ResourceRequest {
    public typealias Resource = ReviewStatistic
    
    public var requestURL: URL {
        return ResourceEndpoints.shared.reviewStatistics.appendingPathComponent("\(id)")
    }
}
