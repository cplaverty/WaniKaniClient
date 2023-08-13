import Foundation

/// A spaced repetition system stage.
///
/// The unlocking (position 0) and burning (maximum position) will always have `nil` for ``interval`` and
/// ``intervalUnit`` since the stages do not influence ``AssignmentResourceData/availableAt``. Stages in between
/// the unlocking and burning stages are the “reviewable” stages.
public struct SpacedRepetitionSystemStage: Codable, Equatable {
    /// The length of time added to the time of review registration, adjusted to the beginning of the hour.
    public var interval: Int?
    /// The position of the stage within the continuous order.
    public var position: Int
    /// Unit of time
    public var intervalUnit: TimeUnit?
    
    public init(interval: Int? = nil,
                position: Int,
                intervalUnit: TimeUnit? = nil) {
        self.interval = interval
        self.position = position
        self.intervalUnit = intervalUnit
    }
    
    private enum CodingKeys: String, CodingKey {
        case interval
        case position
        case intervalUnit = "interval_unit"
    }
}
