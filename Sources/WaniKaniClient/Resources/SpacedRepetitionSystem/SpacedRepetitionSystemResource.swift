import Foundation

/// Available spaced repetition systems used for calculating SRS state changes to ``AssignmentResourceData`` and
/// ``ReviewResourceData``. Has relationship with ``SubjectResource``.
public struct SpacedRepetitionSystemResource: WaniKaniResource {
    /// Unique identifier of the spaced repetition system.
    public var id: Int
    /// The kind of object returned.
    public let objectType: ResourceObjectType = .spacedRepetitionSystem
    /// The URL of the request.
    public var url: URL
    /// The last time that particular resource was updated.
    public var dataUpdatedAt: Date
    public var data: SpacedRepetitionSystemResourceData
    
    public init(id: Int,
                url: URL,
                dataUpdatedAt: Date,
                data: SpacedRepetitionSystemResourceData) {
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
