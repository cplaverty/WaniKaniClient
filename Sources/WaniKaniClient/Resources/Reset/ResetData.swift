import Foundation

public struct ResetData: Codable, Equatable {
    public let createdAt: Date
    public let originalLevel: Int
    public let targetLevel: Int
    public let confirmedAt: Date?
    
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
