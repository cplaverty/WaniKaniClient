import Foundation

public struct GetResetRequest {
    public var id: Int
    
    public init(id: Int) {
        self.id = id
    }
}

extension GetResetRequest: ResourceRequest {
    public typealias Resource = Reset
    
    public var requestURL: URL {
        return ResourceEndpoints.shared.resets.appendingPathComponent("\(id)")
    }
}
