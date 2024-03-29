import XCTest
@testable import WaniKaniClient

final class LevelProgressionResourceTests: XCTestCase {
    func testDecode() throws {
        let testData = """
            {"id":3887,"object":"level_progression","url":"https://api.wanikani.com/v2/level_progressions/3887","data_updated_at":"2019-02-22T20:08:24.387434Z","data":{"created_at":"2017-09-27T22:42:48.841037Z","level":2,"unlocked_at":"2017-09-03T20:57:54.752226Z","started_at":"2017-09-03T20:59:40.499874Z","passed_at":null,"completed_at":null,"abandoned_at":"2019-02-22T20:08:24.380546Z"}}
            """.data(using: .utf8)!
        
        let expected = LevelProgressionResource(
            id: 3887,
            url: URL(string: "https://api.wanikani.com/v2/level_progressions/3887")!,
            dataUpdatedAt: Date.makeUTC(year: 2019, month: 2, day: 22, hour: 20, minute: 8, second: 24, microsecond: 387434),
            data: LevelProgressionResourceData(
                level: 2,
                createdAt: Date.makeUTC(year: 2017, month: 9, day: 27, hour: 22, minute: 42, second: 48, microsecond: 841037),
                unlockedAt: Date.makeUTC(year: 2017, month: 9, day: 3, hour: 20, minute: 57, second: 54, microsecond: 752226),
                startedAt: Date.makeUTC(year: 2017, month: 9, day: 3, hour: 20, minute: 59, second: 40, microsecond: 499874),
                passedAt: nil,
                completedAt: nil,
                abandonedAt: Date.makeUTC(year: 2019, month: 2, day: 22, hour: 20, minute: 8, second: 24, microsecond: 380546)))
        
        let resource = try ResourceDecoder.shared.decode(LevelProgressionResource.self, from: testData)
        
        XCTAssertEqual(resource, expected)
    }
    
    func testRoundTrip() throws {
        let expected = LevelProgressionResource(
            id: 3887,
            url: URL(string: "https://api.wanikani.com/v2/level_progressions/3887")!,
            dataUpdatedAt: Date.makeUTC(year: 2019, month: 2, day: 22, hour: 20, minute: 8, second: 24, microsecond: 387434),
            data: LevelProgressionResourceData(
                level: 2,
                createdAt: Date.makeUTC(year: 2017, month: 9, day: 27, hour: 22, minute: 42, second: 48, microsecond: 841037),
                unlockedAt: Date.makeUTC(year: 2017, month: 9, day: 3, hour: 20, minute: 57, second: 54, microsecond: 752226),
                startedAt: Date.makeUTC(year: 2017, month: 9, day: 3, hour: 20, minute: 59, second: 40, microsecond: 499874),
                passedAt: nil,
                completedAt: nil,
                abandonedAt: Date.makeUTC(year: 2019, month: 2, day: 22, hour: 20, minute: 8, second: 24, microsecond: 380546)))
        
        let encoded = try ResourceEncoder.shared.encode(expected)
        let decoded = try ResourceDecoder.shared.decode(LevelProgressionResource.self, from: encoded)
        
        XCTAssertEqual(decoded, expected)
    }
}
