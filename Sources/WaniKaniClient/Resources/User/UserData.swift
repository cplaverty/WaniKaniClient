import Foundation

public struct UserData: Codable, Equatable {
    public let id: String
    public let username: String
    public let level: Int
    public let profileURL: URL
    public let startedAt: Date
    public let currentVacationStartedAt: Date?
    public let subscription: UserSubscription
    public let preferences: UserPreferences
    
    private enum CodingKeys: String, CodingKey {
        case id
        case username
        case level
        case profileURL = "profile_url"
        case startedAt = "started_at"
        case currentVacationStartedAt = "current_vacation_started_at"
        case subscription
        case preferences
    }
}

public extension UserData {
    var effectiveLevel: Int {
        return min(level, subscription.maxLevelGranted)
    }
}
