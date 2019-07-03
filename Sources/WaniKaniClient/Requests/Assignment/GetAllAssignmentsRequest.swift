import Foundation

public struct GetAllAssignmentsRequest {
    public var availableAfter: Date?
    public var availableBefore: Date?
    public var isBurned: Bool?
    public var isHidden: Bool?
    public var ids: [Int]?
    public var immediatelyAvailableForLessons: Bool?
    public var immediatelyAvailableForReview: Bool?
    public var inReview: Bool?
    public var levels: [Int]?
    public var isPassed: Bool?
    public var isResurrected: Bool?
    public var srsStages: [Int]?
    public var isStarted: Bool?
    public var subjectIDs: [Int]?
    public var subjectTypes: [SubjectType]?
    public var isUnlocked: Bool?
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
                isPassed: Bool? = nil,
                isResurrected: Bool? = nil,
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
        self.isPassed = isPassed
        self.isResurrected = isResurrected
        self.srsStages = srsStages
        self.isStarted = isStarted
        self.subjectIDs = subjectIDs
        self.subjectTypes = subjectTypes
        self.isUnlocked = isUnlocked
        self.updatedAfter = updatedAfter
    }
}

extension GetAllAssignmentsRequest: ResourceCollectionRequest {
    public typealias Resource = Assignment
    
    public var requestURL: URL {
        let url = ResourceEndpoints.shared.assignments
        
        var queryItems = [URLQueryItem]()
        queryItems.appendItemIfSet(name: "available_after", value: availableAfter)
        queryItems.appendItemIfSet(name: "available_before", value: availableBefore)
        queryItems.appendItemIfSet(name: "burned", value: isBurned)
        queryItems.appendItemIfSet(name: "hidden", value: isHidden)
        queryItems.appendItemsIfSet(name: "ids", values: ids)
        queryItems.appendItemIfSet(name: "immediately_available_for_lessons", value: immediatelyAvailableForLessons)
        queryItems.appendItemIfSet(name: "immediately_available_for_review", value: immediatelyAvailableForReview)
        queryItems.appendItemIfSet(name: "in_review", value: inReview)
        queryItems.appendItemsIfSet(name: "levels", values: levels)
        queryItems.appendItemIfSet(name: "passed", value: isPassed)
        queryItems.appendItemIfSet(name: "resurrected", value: isResurrected)
        queryItems.appendItemsIfSet(name: "srs_stages", values: srsStages)
        queryItems.appendItemIfSet(name: "started", value: isStarted)
        queryItems.appendItemsIfSet(name: "subject_ids", values: subjectIDs)
        queryItems.appendItemsIfSet(name: "subject_types", values: subjectTypes)
        queryItems.appendItemIfSet(name: "unlocked", value: isUnlocked)
        queryItems.appendItemIfSet(name: "updated_after", value: updatedAfter)
        
        guard !queryItems.isEmpty else {
            return url
        }
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = queryItems
        return urlComponents.url!
    }
}
