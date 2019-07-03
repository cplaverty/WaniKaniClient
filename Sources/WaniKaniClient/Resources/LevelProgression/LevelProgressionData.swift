import Foundation

public struct LevelProgressionData: Codable, Equatable {
    public let level: Int
    public let createdAt: Date
    public let unlockedAt: Date?
    public let startedAt: Date?
    public let passedAt: Date?
    public let completedAt: Date?
    public let abandonedAt: Date?
    
    private enum CodingKeys: String, CodingKey {
        case level
        case createdAt = "created_at"
        case unlockedAt = "unlocked_at"
        case startedAt = "started_at"
        case passedAt = "passed_at"
        case completedAt = "completed_at"
        case abandonedAt = "abandoned_at"
    }
}

public extension LevelProgressionData {
    var duration: TimeInterval? {
        guard let startedAt = startedAt, let passedAt = passedAt else { return nil }
        return passedAt.timeIntervalSince(startedAt)
    }
}
