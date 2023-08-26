import Foundation

/// Contains information about when resets happen, the starting level, and the target level.
///
/// Users can reset their progress back to any level at or below their current level. When they reset to a particular
/// level, all of the ``AssignmentResource`` and ``ReviewStatisticResource`` at that level or higher are set back
/// to their default state.
public struct ResetResource: WaniKaniResource, Equatable {
    /// Unique identifier of the reset.
    public var id: Int
    /// The kind of object returned.
    public let objectType: ResourceObjectType = .reset
    /// The URL of the request.
    public var url: URL
    /// The last time that particular resource was updated.
    public var dataUpdatedAt: Date
    public var data: ResetResourceData
    
    public init(id: Int,
                url: URL,
                dataUpdatedAt: Date,
                data: ResetResourceData) {
        self.id = id
        self.url = url
        self.dataUpdatedAt = dataUpdatedAt
        self.data = data
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case objectType = "object"
        case url
        case dataUpdatedAt = "data_updated_at"
        case data
    }
}
