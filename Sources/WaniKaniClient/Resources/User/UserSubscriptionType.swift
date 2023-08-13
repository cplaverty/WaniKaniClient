/// The type of subscription the user has.
public enum UserSubscriptionType: String, Codable, CaseIterable {
    case free
    case recurring
    case lifetime
}
