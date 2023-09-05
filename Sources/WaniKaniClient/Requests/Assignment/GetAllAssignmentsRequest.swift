import Foundation

/// Returns a collection of all assignments, ordered by ascending ``AssignmentResourceData/createdAt``, 500 at a time.
///
/// > Important: It is possible for a user to have started an assignment for a subject that was later moved to a
/// level above their current level. To exclude those assignments, filter by levels from 1 to the users current level.
public struct GetAllAssignmentsRequest {
    /// Only assignments available at or after this time are returned.
    public var availableAfter: Date?
    /// Only assignments available at or before this time are returned.
    public var availableBefore: Date?
    /// When `true`, returns assignments that have a value in ``AssignmentResourceData/burnedAt``.
    /// When `false`, returns assignments with ``AssignmentResourceData/burnedAt`` set to `nil`.
    public var isBurned: Bool?
    /// Return assignments with a matching value in ``AssignmentResourceData/isHidden``.
    public var isHidden: Bool?
    /// Only assignments where ``AssignmentResource/id`` matches one of the array values are returned.
    public var ids: [Int]?
    /// Returns assignments which are immediately available for lessons.
    public var immediatelyAvailableForLessons: Bool?
    /// Returns assignments which are immediately available for review.
    public var immediatelyAvailableForReview: Bool?
    /// Returns assignments which are in the review state.
    public var inReview: Bool?
    /// Only assignments where the associated subject level matches one of the array values are returned. Valid values range from 1 to 60.
    public var levels: [Int]?
    /// Only assignments where ``AssignmentResourceData/srsStage`` matches one of the array values are returned. Valid values range from 0 to 9.
    public var srsStages: [Int]?
    /// When `true`, returns assignments that have a value in ``AssignmentResourceData/startedAt``.
    /// When `false`, returns assignments with ``AssignmentResourceData/startedAt`` set to `nil`.
    public var isStarted: Bool?
    /// Only assignments where ``AssignmentResourceData/subjectID`` matches one of the array values are returned.
    public var subjectIDs: [Int]?
    /// Only assignments where ``AssignmentResourceData/subjectType`` matches one of the array values are returned.
    public var subjectTypes: [SubjectType]?
    /// When `true`, returns assignments that have a value in ``AssignmentResourceData/unlockedAt``.
    /// When `false`, returns assignments with ``AssignmentResourceData/unlockedAt`` set to `nil`.
    public var isUnlocked: Bool?
    /// Only assignments updated after this time are returned.
    public var updatedAfter: Date?
    
    public init(availableAfter: Date? = nil,
                availableBefore: Date? = nil,
                isBurned: Bool? = nil,
                isHidden: Bool? = nil,
                ids: [Int]? = nil,
                immediatelyAvailableForLessons: Bool? = nil,
                immediatelyAvailableForReview: Bool? = nil,
                inReview: Bool? = nil,
                levels: [Int]? = nil,
                srsStages: [Int]? = nil,
                isStarted: Bool? = nil,
                subjectIDs: [Int]? = nil,
                subjectTypes: [SubjectType]? = nil,
                isUnlocked: Bool? = nil,
                updatedAfter: Date? = nil) {
        self.availableAfter = availableAfter
        self.availableBefore = availableBefore
        self.isBurned = isBurned
        self.isHidden = isHidden
        self.ids = ids
        self.immediatelyAvailableForLessons = immediatelyAvailableForLessons
        self.immediatelyAvailableForReview = immediatelyAvailableForReview
        self.inReview = inReview
        self.levels = levels
        self.srsStages = srsStages
        self.isStarted = isStarted
        self.subjectIDs = subjectIDs
        self.subjectTypes = subjectTypes
        self.isUnlocked = isUnlocked
        self.updatedAfter = updatedAfter
    }
}

extension GetAllAssignmentsRequest: ResourceCollectionGetRequest {
    public typealias Resource = AssignmentResource
    
    public var url: URL {
        let url = ResourceEndpoints.shared.assignments
        
        var queryItems = [URLQueryItem]()
        queryItems.appendIfSet(name: "available_after", date: availableAfter)
        queryItems.appendIfSet(name: "available_before", date: availableBefore)
        queryItems.appendIfSet(name: "burned", value: isBurned)
        queryItems.appendIfSet(name: "hidden", value: isHidden)
        queryItems.appendIfSet(name: "ids", values: ids)
        queryItems.appendIfTrue(name: "immediately_available_for_lessons", condition: immediatelyAvailableForLessons)
        queryItems.appendIfTrue(name: "immediately_available_for_review", condition: immediatelyAvailableForReview)
        queryItems.appendIfTrue(name: "in_review", condition: inReview)
        queryItems.appendIfSet(name: "levels", values: levels)
        queryItems.appendIfSet(name: "srs_stages", values: srsStages)
        queryItems.appendIfSet(name: "started", value: isStarted)
        queryItems.appendIfSet(name: "subject_ids", values: subjectIDs)
        queryItems.appendIfSet(name: "subject_types", values: subjectTypes)
        queryItems.appendIfSet(name: "unlocked", value: isUnlocked)
        queryItems.appendIfSet(name: "updated_after", date: updatedAfter)
        
        guard !queryItems.isEmpty else {
            return url
        }
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = queryItems
        return urlComponents.url!
    }
}
