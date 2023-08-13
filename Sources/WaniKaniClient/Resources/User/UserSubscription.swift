import Foundation

/// Details about the user's subscription state.
public struct UserSubscription: Codable, Equatable {
    /// Whether or not the user currently has a paid subscription.
    public var isActive: Bool
    /// The type of subscription the user has.
    public var type: UserSubscriptionType
    /// The maximum level of content accessible to the user for lessons, reviews, and content review.
    ///
    /// For unsubscribed/free users, the maximum level is 3. For subscribed users, this is 60.
    /// > Important: Any application that uses data from the WaniKani API must respect these access limits.
    public var maxLevelGranted: Int
    /// The date when the user's subscription period ends. If the user has subscription type
    /// ``UserSubscriptionType/lifetime`` or ``UserSubscriptionType/free`` then the value is `nil`.
    public var periodEndsAt: Date?
    
    public init(isActive: Bool,
                type: UserSubscriptionType,
                maxLevelGranted: Int,
                periodEndsAt: Date? = nil) {
        self.isActive = isActive
        self.type = type
        self.maxLevelGranted = maxLevelGranted
        self.periodEndsAt = periodEndsAt
    }
    
    private enum CodingKeys: String, CodingKey {
        case isActive = "active"
        case type
        case maxLevelGranted = "max_level_granted"
        case periodEndsAt = "period_ends_at"
    }
}
