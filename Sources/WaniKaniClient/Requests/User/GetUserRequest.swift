import Foundation

/// Returns a summary of user information.
public struct GetUserRequest {
    public init() {
    }
}

extension GetUserRequest: ResourceRequest {
    public typealias Resource = UserResource
    
    public var requestURL: URL {
        return ResourceEndpoints.shared.user
    }
}
