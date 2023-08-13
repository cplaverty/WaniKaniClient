import Foundation

/// Reset resource data.
public struct ResetResourceData: Codable, Equatable {
    /// Timestamp when the reset was created.
    public var createdAt: Date
    /// The user's level before the reset, from 1 to 60.
    public var originalLevel: Int
    /// The user's level after the reset, from 1 to 60. It must be less than or equal to ``originalLevel``.
    public var targetLevel: Int
    /// Timestamp when the user confirmed the reset.
    public var confirmedAt: Date?
    
    public init(createdAt: Date,
                originalLevel: Int,
                targetLevel: Int,
                confirmedAt: Date? = nil) {
        self.createdAt = createdAt
        self.originalLevel = originalLevel
        self.targetLevel = targetLevel
        self.confirmedAt = confirmedAt
    }
    
    private enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case originalLevel = "original_level"
        case targetLevel = "target_level"
        case confirmedAt = "confirmed_at"
    }
}
