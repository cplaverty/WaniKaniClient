import Foundation

public struct LevelProgressionResourceData: Codable, Equatable {
    public let level: Int
    public let createdAt: Date
    public let unlockedAt: Date?
    public let startedAt: Date?
    public let passedAt: Date?
    public let completedAt: Date?
    public let abandonedAt: Date?
    
    public init(level: Int,
                createdAt: Date,
                unlockedAt: Date? = nil,
                startedAt: Date? = nil,
                passedAt: Date? = nil,
                completedAt: Date? = nil,
                abandonedAt: Date? = nil) {
        self.level = level
        self.createdAt = createdAt
        self.unlockedAt = unlockedAt
        self.startedAt = startedAt
        self.passedAt = passedAt
        self.completedAt = completedAt
        self.abandonedAt = abandonedAt
    }
    
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
