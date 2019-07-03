import Foundation

public struct GetAssignmentRequest {
    public var id: Int
    
    public init(id: Int) {
        self.id = id
    }
}

extension GetAssignmentRequest: ResourceRequest {
    public typealias Resource = Assignment
    
    public var requestURL: URL {
        return ResourceEndpoints.shared.assignments.appendingPathComponent("\(id)")
    }
}
