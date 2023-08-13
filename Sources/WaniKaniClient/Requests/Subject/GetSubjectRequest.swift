import Foundation

/// Retrieves a specific subject by its ``SubjectResource/id``.
public struct GetSubjectRequest {
    /// Unique identifier of the subject.
    public var id: Int
    
    public init(id: Int) {
        self.id = id
    }
}

extension GetSubjectRequest: ResourceRequest {
    public typealias Resource = SubjectResource
    
    public var requestURL: URL {
        return ResourceEndpoints.shared.subjects.appendingPathComponent("\(id)")
    }
}
