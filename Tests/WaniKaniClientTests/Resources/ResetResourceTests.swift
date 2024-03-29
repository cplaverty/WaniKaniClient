import XCTest
@testable import WaniKaniClient

final class ResetResourceTests: XCTestCase {
    func testDecode() throws {
        let testData = """
            {"id":1953,"object":"reset","url":"https://api.wanikani.com/v2/resets/1953","data_updated_at":"2017-08-10T18:55:10.886050Z","data":{"created_at":"2017-08-10T18:53:51.328781Z","original_level":2,"target_level":1,"confirmed_at":"2017-08-10T18:54:56.574440Z"}}
            """.data(using: .utf8)!
        
        let expected = ResetResource(
            id: 1953,
            url: URL(string: "https://api.wanikani.com/v2/resets/1953")!,
            dataUpdatedAt: Date.makeUTC(year: 2017, month: 8, day: 10, hour: 18, minute: 55, second: 10, microsecond: 886050),
            data: ResetResourceData(
                createdAt: Date.makeUTC(year: 2017, month: 8, day: 10, hour: 18, minute: 53, second: 51, microsecond: 328781),
                originalLevel: 2,
                targetLevel: 1,
                confirmedAt: Date.makeUTC(year: 2017, month: 8, day: 10, hour: 18, minute: 54, second: 56, microsecond: 574440)))
        
        let resource = try ResourceDecoder.shared.decode(ResetResource.self, from: testData)
        
        XCTAssertEqual(resource, expected)
    }
    
    func testRoundTrip() throws {
        let expected = ResetResource(
            id: 1953,
            url: URL(string: "https://api.wanikani.com/v2/resets/1953")!,
            dataUpdatedAt: Date.makeUTC(year: 2017, month: 8, day: 10, hour: 18, minute: 55, second: 10, microsecond: 886050),
            data: ResetResourceData(
                createdAt: Date.makeUTC(year: 2017, month: 8, day: 10, hour: 18, minute: 53, second: 51, microsecond: 328781),
                originalLevel: 2,
                targetLevel: 1,
                confirmedAt: Date.makeUTC(year: 2017, month: 8, day: 10, hour: 18, minute: 54, second: 56, microsecond: 574440)))
        
        let encoded = try ResourceEncoder.shared.encode(expected)
        let decoded = try ResourceDecoder.shared.decode(ResetResource.self, from: encoded)
        
        XCTAssertEqual(decoded, expected)
    }
}
