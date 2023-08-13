import Foundation

/// Level progressions contain information about a user's progress through the WaniKani levels.
///
/// A level progression is created when a user has met the prerequisites for leveling up, which are:
/// - Reach a 90% passing rate on assignments for a user's current level with a ``SubjectType`` of ``SubjectType/kanji``. Passed assignments have a ``AssignmentResourceData/passedAt`` that's in the past.
/// - Have access to the level. In the ``UserResource``, the ``UserResourceData/level`` must be less than or equal to ``UserSubscription/maxLevelGranted``.
public struct LevelProgressionResource: WaniKaniResource {
    /// Unique identifier of the level progression.
    public var id: Int
    /// The kind of object returned.
    public let objectType: ResourceObjectType = .levelProgression
    /// The URL of the request.
    public var url: URL
    /// The last time that particular resource was updated.
    public var dataUpdatedAt: Date
    public var data: LevelProgressionResourceData
    
    public init(id: Int,
                url: URL,
                dataUpdatedAt: Date,
                data: LevelProgressionResourceData) {
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
