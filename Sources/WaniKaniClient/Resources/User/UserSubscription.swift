import Foundation

public struct UserSubscription: Codable, Equatable {
    public var isActive: Bool
    public var type: UserSubscriptionType
    public var maxLevelGranted: Int
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
