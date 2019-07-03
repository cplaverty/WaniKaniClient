import Foundation

public struct UserSubscription: Codable, Equatable {
    public let isActive: Bool
    public let type: UserSubscriptionType
    public let maxLevelGranted: Int
    public let periodEndsAt: Date?
    
    private enum CodingKeys: String, CodingKey {
        case isActive = "active"
        case type
        case maxLevelGranted = "max_level_granted"
        case periodEndsAt = "period_ends_at"
    }
}
