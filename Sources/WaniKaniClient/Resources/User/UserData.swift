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
    
    public init(id: String,
                username: String,
                level: Int,
                profileURL: URL,
                startedAt: Date,
                currentVacationStartedAt: Date? = nil,
                subscription: UserSubscription,
                preferences: UserPreferences) {
        self.id = id
        self.username = username
        self.level = level
        self.profileURL = profileURL
        self.startedAt = startedAt
        self.currentVacationStartedAt = currentVacationStartedAt
        self.subscription = subscription
        self.preferences = preferences
    }
    
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
