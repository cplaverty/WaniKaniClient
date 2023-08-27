import Foundation

/// Mark an assignment as started, moving the assignment from the lessons queue to the review queue.
///
/// The assignment must be in the following valid state:
///
/// Attribute | State
/// --------- | -----
/// Subject ``SubjectResourceData/level`` | Must be less than or equal to the lowest value of User's ``UserResourceData/level`` and subscription ``UserSubscription/maxLevelGranted``
/// ``AssignmentResourceData/srsStage`` | Must be equal to 0
/// ``AssignmentResourceData/startedAt`` | Must be equal to `nil`
/// ``AssignmentResourceData/unlockedAt`` | Must not be `nil`
public struct StartAssignmentRequest {
    /// Unique identifier of the assignment.
    public var id: Int
    /// Timestamp when the user completed the lesson for the related subject.
    ///
    /// - If not set, ``startedAt`` will default to the time the request is made.
    /// - ``startedAt`` must be greater than or equal to ``AssignmentResourceData/unlockedAt``.
    public var startedAt: Date?
    
    public init(id: Int,
                startedAt: Date? = nil) {
        self.id = id
        self.startedAt = startedAt
    }
}

extension StartAssignmentRequest: ResourceUpdateRequest {
    public typealias Resource = AssignmentResource
    
    public var url: URL {
        return ResourceEndpoints.shared.assignments
            .appendingPathComponent("\(id)")
            .appendingPathComponent("start")
    }
    
    public var httpMethod: String {
        return "PUT"
    }
    
    public var bodyContent: Codable {
        return BodyContent(startedAt: startedAt)
    }
    
    private struct BodyContent: Codable {
        var startedAt: Date?
        
        private enum CodingKeys: String, CodingKey {
            case startedAt = "started_at"
        }
    }
}
