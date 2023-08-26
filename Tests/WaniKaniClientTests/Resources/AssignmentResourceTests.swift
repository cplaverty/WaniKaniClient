import XCTest
@testable import WaniKaniClient

final class AssignmentResourceTests: XCTestCase {
    func testDecode() throws {
        let testData = """
            {"id":79854763,"object":"assignment","url":"https://api.wanikani.com/v2/assignments/79854763","data_updated_at":"2019-05-29T23:08:08.254118Z","data":{"created_at":"2017-08-30T22:41:46.796284Z","subject_id":442,"subject_type":"kanji","srs_stage":5,"unlocked_at":"2019-02-24T22:51:46.976224Z","started_at":"2019-03-10T22:51:26.490164Z","passed_at":"2019-05-29T23:08:08.250981Z","burned_at":null,"available_at":"2019-06-05T22:00:00.000000Z","resurrected_at":null,"hidden":false}}
            """.data(using: .utf8)!
        
        let expected = AssignmentResource(
            id: 79854763,
            url: URL(string: "https://api.wanikani.com/v2/assignments/79854763")!,
            dataUpdatedAt: Date.makeUTC(year: 2019, month: 5, day: 29, hour: 23, minute: 8, second: 8, microsecond: 254118),
            data: AssignmentResourceData(
                createdAt: Date.makeUTC(year: 2017, month: 8, day: 30, hour: 22, minute: 41, second: 46, microsecond: 796284),
                subjectID: 442,
                subjectType: .kanji,
                srsStage: 5,
                unlockedAt: Date.makeUTC(year: 2019, month: 2, day: 24, hour: 22, minute: 51, second: 46, microsecond: 976224),
                startedAt: Date.makeUTC(year: 2019, month: 3, day: 10, hour: 22, minute: 51, second: 26, microsecond: 490164),
                passedAt: Date.makeUTC(year: 2019, month: 5, day: 29, hour: 23, minute: 8, second: 8, microsecond: 250981),
                burnedAt: nil,
                availableAt: Date.makeUTC(year: 2019, month: 6, day: 5, hour: 22),
                resurrectedAt: nil,
                isHidden: false))
        
        let resource = try ResourceDecoder.shared.decode(AssignmentResource.self, from: testData)
        
        XCTAssertEqual(resource, expected)
    }
    
    func testRoundTrip() throws {
        let expected = AssignmentResource(
            id: 79854763,
            url: URL(string: "https://api.wanikani.com/v2/assignments/79854763")!,
            dataUpdatedAt: Date.makeUTC(year: 2019, month: 5, day: 29, hour: 23, minute: 8, second: 8, microsecond: 254118),
            data: AssignmentResourceData(
                createdAt: Date.makeUTC(year: 2017, month: 8, day: 30, hour: 22, minute: 41, second: 46, microsecond: 796284),
                subjectID: 442,
                subjectType: .kanji,
                srsStage: 5,
                unlockedAt: Date.makeUTC(year: 2019, month: 2, day: 24, hour: 22, minute: 51, second: 46, microsecond: 976224),
                startedAt: Date.makeUTC(year: 2019, month: 3, day: 10, hour: 22, minute: 51, second: 26, microsecond: 490164),
                passedAt: Date.makeUTC(year: 2019, month: 5, day: 29, hour: 23, minute: 8, second: 8, microsecond: 250981),
                burnedAt: nil,
                availableAt: Date.makeUTC(year: 2019, month: 6, day: 5, hour: 22),
                resurrectedAt: nil,
                isHidden: false))
        
        let encoded = try ResourceEncoder.shared.encode(expected)
        let decoded = try ResourceDecoder.shared.decode(AssignmentResource.self, from: encoded)
        
        XCTAssertEqual(decoded, expected)
    }
}
