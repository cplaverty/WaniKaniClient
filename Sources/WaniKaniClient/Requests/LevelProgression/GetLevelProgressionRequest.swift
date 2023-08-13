import Foundation

/// Retrieves a specific level progression by its ``LevelProgressionResource/id``.
public struct GetLevelProgressionRequest {
    /// Unique identifier of the level progression.
    public var id: Int
    
    public init(id: Int) {
        self.id = id
    }
}

extension GetLevelProgressionRequest: ResourceRequest {
    public typealias Resource = LevelProgressionResource
    
    public var requestURL: URL {
        return ResourceEndpoints.shared.levelProgressions.appendingPathComponent("\(id)")
    }
}
