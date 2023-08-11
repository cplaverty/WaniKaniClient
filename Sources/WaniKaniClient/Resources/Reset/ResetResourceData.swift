import Foundation

public struct ResetResourceData: Codable, Equatable {
    public var createdAt: Date
    public var originalLevel: Int
    public var targetLevel: Int
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
