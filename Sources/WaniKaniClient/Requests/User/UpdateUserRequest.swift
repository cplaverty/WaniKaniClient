import Foundation

/// Updates user information.
public struct UpdateUserRequest {
    /// User settings specific to the WaniKani application.
    public var preferences: UserPreferencesUpdate
    
    public init(preferences: UserPreferencesUpdate) {
        self.preferences = preferences
    }
}

extension UpdateUserRequest: ResourceUpdateRequest, Codable {
    public typealias Resource = UserResource
    
    public var requestURL: URL {
        return ResourceEndpoints.shared.user
    }
    
    public var httpMethod: String {
        return "PUT"
    }
    
    public var bodyContent: Codable {
        return BodyContent(user: self)
    }
    
    private struct BodyContent: Codable {
        var user: UpdateUserRequest
    }
}
