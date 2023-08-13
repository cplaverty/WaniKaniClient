import Foundation

/// Retrieves a specific reset by its ``ResetResource/id``.
public struct GetResetRequest {
    /// Unique identifier of the reset.
    public var id: Int
    
    public init(id: Int) {
        self.id = id
    }
}

extension GetResetRequest: ResourceGetRequest {
    public typealias Resource = ResetResource
    
    public var requestURL: URL {
        return ResourceEndpoints.shared.resets.appendingPathComponent("\(id)")
    }
}
