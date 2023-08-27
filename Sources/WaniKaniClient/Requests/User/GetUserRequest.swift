import Foundation

/// Returns a summary of user information.
public struct GetUserRequest {
    public init() {
    }
}

extension GetUserRequest: ResourceGetRequest {
    public typealias Resource = UserResource
    
    public var url: URL {
        return ResourceEndpoints.shared.user
    }
}
