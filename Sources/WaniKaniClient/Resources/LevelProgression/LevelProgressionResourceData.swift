import Foundation

/// Level progression data.
public struct LevelProgressionResourceData: Codable, Equatable {
    /// The level of the progression, with possible values from 1 to 60.
    public var level: Int
    /// Timestamp when the level progression is created.
    public var createdAt: Date
    /// Timestamp when the user can access lessons and reviews for the ``level``.
    public var unlockedAt: Date?
    /// Timestamp when the user starts their first lesson of a subject belonging to the level.
    public var startedAt: Date?
    /// Timestamp when the user passes at least 90% of the assignments with a type of ``SubjectType/kanji`` belonging to the associated subject's level.
    public var passedAt: Date?
    /// Timestamp when the user burns 100% of the assignments belonging to the associated subject's level.
    public var completedAt: Date?
    /// Timestamp when the user abandons the level. This is primary used when the user initiates a reset.
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
