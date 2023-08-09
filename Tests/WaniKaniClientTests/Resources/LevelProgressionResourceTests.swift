import XCTest
@testable import WaniKaniClient

final class LevelProgressionResourceTests: XCTestCase {
    private let testData = """
            {"id":3887,"object":"level_progression","url":"https://api.wanikani.com/v2/level_progressions/3887","data_updated_at":"2019-02-22T20:08:24.387434Z","data":{"created_at":"2017-09-27T22:42:48.841037Z","level":2,"unlocked_at":"2017-09-03T20:57:54.752226Z","started_at":"2017-09-03T20:59:40.499874Z","passed_at":null,"completed_at":null,"abandoned_at":"2019-02-22T20:08:24.380546Z"}}
            """.data(using: .utf8)!
    
    func testDecode() throws {
        let decoder = ResourceDecoder()
        
        let resource = try decoder.decode(LevelProgressionResource.self, from: testData)
        
        let expected = LevelProgressionResource(
            id: 3887,
            url: URL(string: "https://api.wanikani.com/v2/level_progressions/3887")!,
            dataUpdatedAt: makeUTCDate(year: 2019, month: 2, day: 22, hour: 20, minute: 8, second: 24, microsecond: 387434),
            data: LevelProgressionResourceData(
                level: 2,
                createdAt: makeUTCDate(year: 2017, month: 9, day: 27, hour: 22, minute: 42, second: 48, microsecond: 841037),
                unlockedAt: makeUTCDate(year: 2017, month: 9, day: 3, hour: 20, minute: 57, second: 54, microsecond: 752226),
                startedAt: makeUTCDate(year: 2017, month: 9, day: 3, hour: 20, minute: 59, second: 40, microsecond: 499874),
                passedAt: nil,
                completedAt: nil,
                abandonedAt: makeUTCDate(year: 2019, month: 2, day: 22, hour: 20, minute: 8, second: 24, microsecond: 380546)))
        
        XCTAssertEqual(resource, expected)
    }
}
