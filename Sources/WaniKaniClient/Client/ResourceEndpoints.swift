import Foundation

public final class ResourceEndpoints {
    public static var shared = ResourceEndpoints(baseURL: URL(string: "https://api.wanikani.com/v2/")!)
    
    public private(set) lazy var assignments: URL = baseURL.appendingPathComponent("assignments")
    public private(set) lazy var levelProgressions: URL = baseURL.appendingPathComponent("level_progressions")
    public private(set) lazy var resets: URL = baseURL.appendingPathComponent("resets")
    public private(set) lazy var reviews: URL = baseURL.appendingPathComponent("reviews")
    public private(set) lazy var reviewStatistics: URL = baseURL.appendingPathComponent("review_statistics")
    public private(set) lazy var spacedRepetitionSystems: URL = baseURL.appendingPathComponent("spaced_repetition_systems")
    public private(set) lazy var studyMaterials: URL = baseURL.appendingPathComponent("study_materials")
    public private(set) lazy var subjects: URL = baseURL.appendingPathComponent("subjects")
    public private(set) lazy var user: URL = baseURL.appendingPathComponent("user")
    public private(set) lazy var voiceActors: URL = baseURL.appendingPathComponent("voice_actors")

    public let baseURL: URL
    
    public init(baseURL: URL) {
        self.baseURL = baseURL
    }
}
