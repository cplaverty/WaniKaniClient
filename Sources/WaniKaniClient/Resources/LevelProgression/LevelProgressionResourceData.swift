import Foundation

public struct LevelProgressionResourceData: Codable, Equatable {
    public var level: Int
    public var createdAt: Date
    public var unlockedAt: Date?
    public var startedAt: Date?
    public var passedAt: Date?
    public var completedAt: Date?
    public var abandonedAt: Date?
    
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
