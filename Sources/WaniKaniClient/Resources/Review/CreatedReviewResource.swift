import Foundation

/// When a review is registered, the associated ``AssignmentResource`` and ``ReviewStatisticResource`` are both
/// updated. These are returned in ``resourcesUpdated``.
public struct CreatedReviewResource: WaniKaniResource, Equatable {
    /// Unique identifier of the review.
    public var id: Int
    /// The kind of object returned.
    public let objectType: ResourceObjectType = .review
    /// The URL of the request.
    public var url: URL
    /// The last time that particular resource was updated.
    public var dataUpdatedAt: Date
    public var data: ReviewResourceData
    public var resourcesUpdated: ReviewResourcesUpdated
    
    public init(id: Int,
                url: URL,
                dataUpdatedAt: Date,
                data: ReviewResourceData,
                resourcesUpdated: ReviewResourcesUpdated) {
        self.id = id
        self.url = url
        self.dataUpdatedAt = dataUpdatedAt
        self.data = data
        self.resourcesUpdated = resourcesUpdated
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case objectType = "object"
        case url
        case dataUpdatedAt = "data_updated_at"
        case data
        case resourcesUpdated = "resources_updated"
    }
}
