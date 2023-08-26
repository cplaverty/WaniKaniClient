import Foundation

/// A review statistic is created when the user has done their first review on the related subject.
///
/// Review statistics summarize the activity recorded in reviews. They contain the sum of the number of correct and
/// incorrect answers for both meaning and reading. They track current and maximum streaks of correct answers.
/// They store the overall percentage of correct answers versus total answers.
public struct ReviewStatisticResource: WaniKaniResource, Equatable {
    /// Unique identifier of the review statistic.
    public var id: Int
    /// The kind of object returned.
    public let objectType: ResourceObjectType = .reviewStatistic
    /// The URL of the request.
    public var url: URL
    /// The last time that particular resource was updated.
    public var dataUpdatedAt: Date
    public var data: ReviewStatisticResourceData
    
    public init(id: Int,
                url: URL,
                dataUpdatedAt: Date,
                data: ReviewStatisticResourceData) {
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
