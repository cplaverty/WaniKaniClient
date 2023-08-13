import Foundation

/// Reviews log all the correct and incorrect answers provided through the 'Reviews' section of WaniKani. Review
/// records are created when a user answers all the parts of a subject correctly once; some subjects have both
/// meaning or reading parts, and some only have one or the other. Note that reviews are not created for the quizzes
/// in lessons.
public struct ReviewResource: WaniKaniResource {
    /// Unique identifier of the review.
    public var id: Int
    /// The kind of object returned.
    public let objectType: ResourceObjectType = .review
    /// The URL of the request.
    public var url: URL
    /// The last time that particular resource was updated.
    public var dataUpdatedAt: Date
    public var data: ReviewResourceData
    
    public init(id: Int,
                url: URL,
                dataUpdatedAt: Date,
                data: ReviewResourceData) {
        self.id = id
        self.url = url
        self.dataUpdatedAt = dataUpdatedAt
        self.data = data
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case objectType = "object"
        case url
        case dataUpdatedAt = "data_updated_at"
        case data
    }
}
