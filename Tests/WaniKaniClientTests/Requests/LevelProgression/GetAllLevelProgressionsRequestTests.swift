import XCTest
@testable import WaniKaniClient

final class GetAllLevelProgressionsRequestTests: XCTestCase {
    private let baseURL = URL(string: "https://api.wanikani.com/v2/")!
    
    func testNoParams() {
        let expected = URL(string: "level_progressions", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllLevelProgressionsRequest()
        
        XCTAssertEqual(request.requestURL, expected)
    }
    
    func testIDs() {
        let expected = URL(string: "level_progressions?ids=3887,3943,4234,4432", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllLevelProgressionsRequest(ids: [3887, 3943, 4234, 4432])
        
        XCTAssertEqual(request.requestURL, expected)
    }
    
    func testUpdatedAfter() {
        // DateFormatter only has millisecond precision
        let expected = URL(string: "level_progressions?updated_after=2019-03-01T18:10:34.873Z", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllLevelProgressionsRequest(updatedAfter: makeUTCDate(year: 2019, month: 3, day: 1, hour: 18, minute: 10, second: 34, microsecond: 873542))
        
        XCTAssertEqual(request.requestURL, expected)
    }
}
