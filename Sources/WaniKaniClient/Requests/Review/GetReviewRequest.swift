import Foundation

/// Retrieves a specific review by its ``ReviewResource/id``.
public struct GetReviewRequest {
    /// Unique identifier of the review.
    public var id: Int
    
    public init(id: Int) {
        self.id = id
    }
}

extension GetReviewRequest: ResourceRequest {
    public typealias Resource = ReviewResource
    
    public var requestURL: URL {
        return ResourceEndpoints.shared.reviews.appendingPathComponent("\(id)")
    }
}
