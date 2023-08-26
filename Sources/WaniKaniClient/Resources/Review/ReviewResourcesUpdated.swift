/// The updated ``AssignmentResource`` and ``ReviewStatisticResource`` as the result of a review registration.
public struct ReviewResourcesUpdated: Codable, Equatable {
    public var assignment: AssignmentResource
    public var reviewStatistic: ReviewStatisticResource
    
    public init(assignment: AssignmentResource,
                reviewStatistic: ReviewStatisticResource) {
        self.assignment = assignment
        self.reviewStatistic = reviewStatistic
    }
    
    private enum CodingKeys: String, CodingKey {
        case assignment
        case reviewStatistic = "review_statistic"
    }
}
