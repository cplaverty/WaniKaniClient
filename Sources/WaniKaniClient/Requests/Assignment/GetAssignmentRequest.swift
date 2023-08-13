import Foundation

/// Retrieves a specific assignment by its ``AssignmentResource/id``.
public struct GetAssignmentRequest {
    /// Unique identifier of the assignment.
    public var id: Int
    
    public init(id: Int) {
        self.id = id
    }
}

extension GetAssignmentRequest: ResourceGetRequest {
    public typealias Resource = AssignmentResource
    
    public var requestURL: URL {
        return ResourceEndpoints.shared.assignments.appendingPathComponent("\(id)")
    }
}
