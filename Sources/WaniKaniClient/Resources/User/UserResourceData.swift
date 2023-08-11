import Foundation

public struct UserResourceData: Codable, Equatable {
    public var id: String
    public var username: String
    public var level: Int
    public var profileURL: URL
    public var startedAt: Date
    public var currentVacationStartedAt: Date?
    public var subscription: UserSubscription
    public var preferences: UserPreferences
    
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
