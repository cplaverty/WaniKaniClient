import Foundation

public struct GetSubjectRequest {
    public var id: Int
    
    public init(id: Int) {
        self.id = id
    }
}

extension GetSubjectRequest: ResourceRequest {
    public typealias Resource = Subject
    
    public var requestURL: URL {
        return ResourceEndpoints.shared.subjects.appendingPathComponent("\(id)")
    }
}
