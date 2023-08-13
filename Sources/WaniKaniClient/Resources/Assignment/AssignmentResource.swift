import Foundation

/// Assignments contain information about a user's progress on a particular subject, including their current state and
/// timestamps for various progress milestones. Assignments are created when a user has passed all the components of
/// the given subject and the assignment is at or below their current level for the first time.
public struct AssignmentResource: WaniKaniResource {
    /// Unique identifier of the assignment.
    public var id: Int
    /// The kind of object returned.
    public let objectType: ResourceObjectType = .assignment
    /// The URL of the request.
    public var url: URL
    /// The last time that particular resource was updated.
    public var dataUpdatedAt: Date
    public var data: AssignmentResourceData
    
    public init(id: Int,
                url: URL,
                dataUpdatedAt: Date,
                data: AssignmentResourceData) {
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
