import Foundation

public struct AssignmentResourceData: Codable, Equatable {
    public var createdAt: Date
    public var subjectID: Int
    public var subjectType: SubjectType
    public var srsStage: Int
    public var srsStageName: String
    public var unlockedAt: Date?
    public var startedAt: Date?
    public var passedAt: Date?
    public var burnedAt: Date?
    public var availableAt: Date?
    public var resurrectedAt: Date?
    public var isPassed: Bool
    public var isResurrected: Bool
    public var isHidden: Bool
    
    public init(createdAt: Date,
                subjectID: Int,
                subjectType: SubjectType,
                srsStage: Int,
                srsStageName: String,
                unlockedAt: Date? = nil,
                startedAt: Date? = nil,
                passedAt: Date? = nil,
                burnedAt: Date? = nil,
                availableAt: Date? = nil,
                resurrectedAt: Date? = nil,
                isPassed: Bool,
                isResurrected: Bool,
                isHidden: Bool) {
        self.createdAt = createdAt
        self.subjectID = subjectID
        self.subjectType = subjectType
        self.srsStage = srsStage
        self.srsStageName = srsStageName
        self.unlockedAt = unlockedAt
        self.startedAt = startedAt
        self.passedAt = passedAt
        self.burnedAt = burnedAt
        self.availableAt = availableAt
        self.resurrectedAt = resurrectedAt
        self.isPassed = isPassed
        self.isResurrected = isResurrected
        self.isHidden = isHidden
    }
    
    private enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case subjectID = "subject_id"
        case subjectType = "subject_type"
        case srsStage = "srs_stage"
        case srsStageName = "srs_stage_name"
        case unlockedAt = "unlocked_at"
        case startedAt = "started_at"
        case passedAt = "passed_at"
        case burnedAt = "burned_at"
        case availableAt = "available_at"
        case resurrectedAt = "resurrected_at"
        case isPassed = "passed"
        case isResurrected = "resurrected"
        case isHidden = "hidden"
    }
}
