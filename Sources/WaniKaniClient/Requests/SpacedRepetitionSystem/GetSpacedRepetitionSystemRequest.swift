import Foundation

/// Retrieves a specific spaced repetition system by its ``SpacedRepetitionSystemResource/id``.
public struct GetSpacedRepetitionSystemRequest {
    /// Unique identifier of the spaced repetition system.
    public var id: Int
    
    public init(id: Int) {
        self.id = id
    }
}

extension GetSpacedRepetitionSystemRequest: ResourceRequest {
    public typealias Resource = SpacedRepetitionSystemResource
    
    public var requestURL: URL {
        return ResourceEndpoints.shared.spacedRepetitionSystems.appendingPathComponent("\(id)")
    }
}
