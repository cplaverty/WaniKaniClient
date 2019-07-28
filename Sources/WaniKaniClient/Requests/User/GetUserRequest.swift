import Foundation

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
