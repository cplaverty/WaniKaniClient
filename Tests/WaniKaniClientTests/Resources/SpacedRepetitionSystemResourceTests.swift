import XCTest
@testable import WaniKaniClient

final class SpacedRepetitionSystemResourceTests: XCTestCase {
    func testDecode() throws {
        let testData = """
            {"id":1,"object":"spaced_repetition_system","url":"https://api.wanikani.com/v2/spaced_repetition_systems/1","data_updated_at":"2020-06-09T03:36:51.134752Z","data":{"created_at":"2020-05-21T20:46:06.464460Z","name":"Default system for dictionary subjects","description":"The original spaced repetition system","unlocking_stage_position":0,"starting_stage_position":1,"passing_stage_position":5,"burning_stage_position":9,"stages":[{"interval":null,"position":0,"interval_unit":null},{"interval":14400,"position":1,"interval_unit":"seconds"},{"interval":28800,"position":2,"interval_unit":"seconds"},{"interval":82800,"position":3,"interval_unit":"seconds"},{"interval":169200,"position":4,"interval_unit":"seconds"},{"interval":601200,"position":5,"interval_unit":"seconds"},{"interval":1206000,"position":6,"interval_unit":"seconds"},{"interval":2588400,"position":7,"interval_unit":"seconds"},{"interval":10364400,"position":8,"interval_unit":"seconds"},{"interval":null,"position":9,"interval_unit":null}]}}
            """.data(using: .utf8)!
        
        let expected = SpacedRepetitionSystemResource(
            id: 1,
            url: URL(string: "https://api.wanikani.com/v2/spaced_repetition_systems/1")!,
            dataUpdatedAt: Date.makeUTC(year: 2020, month: 6, day: 9, hour: 3, minute: 36, second: 51, microsecond: 134752),
            data: SpacedRepetitionSystemResourceData(
                createdAt: Date.makeUTC(year: 2020, month: 5, day: 21, hour: 20, minute: 46, second: 6, microsecond: 464460),
                name: "Default system for dictionary subjects",
                description: "The original spaced repetition system",
                unlockingStagePosition: 0,
                startingStagePosition: 1,
                passingStagePosition: 5,
                burningStagePosition: 9,
                stages: [
                    SpacedRepetitionSystemStage(interval: nil, position: 0, intervalUnit: nil),
                    SpacedRepetitionSystemStage(interval: 14400, position: 1, intervalUnit: .seconds),
                    SpacedRepetitionSystemStage(interval: 28800, position: 2, intervalUnit: .seconds),
                    SpacedRepetitionSystemStage(interval: 82800, position: 3, intervalUnit: .seconds),
                    SpacedRepetitionSystemStage(interval: 169200, position: 4, intervalUnit: .seconds),
                    SpacedRepetitionSystemStage(interval: 601200, position: 5, intervalUnit: .seconds),
                    SpacedRepetitionSystemStage(interval: 1206000, position: 6, intervalUnit: .seconds),
                    SpacedRepetitionSystemStage(interval: 2588400, position: 7, intervalUnit: .seconds),
                    SpacedRepetitionSystemStage(interval: 10364400, position: 8, intervalUnit: .seconds),
                    SpacedRepetitionSystemStage(interval: nil, position: 9, intervalUnit: nil)
                ]))
        
        let resource = try ResourceDecoder.shared.decode(SpacedRepetitionSystemResource.self, from: testData)
        
        XCTAssertEqual(resource, expected)
    }
    
    func testRoundTrip() throws {
        let expected = SpacedRepetitionSystemResource(
            id: 1,
            url: URL(string: "https://api.wanikani.com/v2/spaced_repetition_systems/1")!,
            dataUpdatedAt: Date.makeUTC(year: 2020, month: 6, day: 9, hour: 3, minute: 36, second: 51, microsecond: 134752),
            data: SpacedRepetitionSystemResourceData(
                createdAt: Date.makeUTC(year: 2020, month: 5, day: 21, hour: 20, minute: 46, second: 6, microsecond: 464460),
                name: "Default system for dictionary subjects",
                description: "The original spaced repetition system",
                unlockingStagePosition: 0,
                startingStagePosition: 1,
                passingStagePosition: 5,
                burningStagePosition: 9,
                stages: [
                    SpacedRepetitionSystemStage(interval: nil, position: 0, intervalUnit: nil),
                    SpacedRepetitionSystemStage(interval: 14400, position: 1, intervalUnit: .seconds),
                    SpacedRepetitionSystemStage(interval: 28800, position: 2, intervalUnit: .seconds),
                    SpacedRepetitionSystemStage(interval: 82800, position: 3, intervalUnit: .seconds),
                    SpacedRepetitionSystemStage(interval: 169200, position: 4, intervalUnit: .seconds),
                    SpacedRepetitionSystemStage(interval: 601200, position: 5, intervalUnit: .seconds),
                    SpacedRepetitionSystemStage(interval: 1206000, position: 6, intervalUnit: .seconds),
                    SpacedRepetitionSystemStage(interval: 2588400, position: 7, intervalUnit: .seconds),
                    SpacedRepetitionSystemStage(interval: 10364400, position: 8, intervalUnit: .seconds),
                    SpacedRepetitionSystemStage(interval: nil, position: 9, intervalUnit: nil)
                ]))
        
        let encoded = try ResourceEncoder.shared.encode(expected)
        let decoded = try ResourceDecoder.shared.decode(SpacedRepetitionSystemResource.self, from: encoded)
        
        XCTAssertEqual(decoded, expected)
    }
}
