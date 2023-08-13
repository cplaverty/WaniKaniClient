import Foundation

/// Spaced repetition system resource data.
///
/// The `position` fields align with the timestamps on ``AssignmentResource``:
/// ``unlockingStagePosition`` => ``AssignmentResourceData/unlockedAt``,
/// ``passingStagePosition`` => ``AssignmentResourceData/passedAt``, etc.
public struct SpacedRepetitionSystemResourceData: Codable, Equatable {
    /// Timestamp when the spaced repetition system was created.
    public var createdAt: Date
    /// The name of the spaced repetition system.
    public var name: String
    /// Details about the spaced repetition system.
    public var description: String
    /// Position of the unlocking stage.
    public var unlockingStagePosition: Int
    /// Position of the starting stage.
    public var startingStagePosition: Int
    /// Position of the passing stage.
    public var passingStagePosition: Int
    /// Position of the burning stage.
    public var burningStagePosition: Int
    /// A collection of stages.
    public var stages: [SpacedRepetitionSystemStage]
    
    public init(createdAt: Date,
                name: String,
                description: String,
                unlockingStagePosition: Int,
                startingStagePosition: Int,
                passingStagePosition: Int,
                burningStagePosition: Int,
                stages: [SpacedRepetitionSystemStage]) {
        self.createdAt = createdAt
        self.name = name
        self.description = description
        self.unlockingStagePosition = unlockingStagePosition
        self.startingStagePosition = startingStagePosition
        self.passingStagePosition = passingStagePosition
        self.burningStagePosition = burningStagePosition
        self.stages = stages
    }
    
    private enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case name
        case description
        case unlockingStagePosition = "unlocking_stage_position"
        case startingStagePosition = "starting_stage_position"
        case passingStagePosition = "passing_stage_position"
        case burningStagePosition = "burning_stage_position"
        case stages
    }
}
