import Foundation

public struct UserResourceData: Codable, Equatable {
    /// Unique identifier of the user.
    public var id: String
    /// The user's username.
    public var username: String
    /// The current level of the user. This ignores subscription status.
    public var level: Int
    /// The URL to the user's public facing profile page.
    public var profileURL: URL
    /// The signup date for the user.
    public var startedAt: Date
    /// If the user is on vacation, this will be the timestamp of when that vacation started. If the user is not on vacation, this is `nil`.
    public var currentVacationStartedAt: Date?
    /// Details about the user's subscription state.
    public var subscription: UserSubscription
    /// User settings specific to the WaniKani application.
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
