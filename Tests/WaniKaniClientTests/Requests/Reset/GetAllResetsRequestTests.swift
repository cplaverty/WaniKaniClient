import XCTest
@testable import WaniKaniClient

final class GetAllResetsRequestTests: XCTestCase {
    private let baseURL = URL(string: "https://api.wanikani.com/v2/")!
    
    func testNoParams() {
        let expected = URL(string: "resets", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllResetsRequest()
        
        XCTAssertEqual(request.requestURL, expected)
    }
    
    func testIDs() {
        let expected = URL(string: "resets?ids=3887,3943,4234,4432", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllResetsRequest(ids: [3887, 3943, 4234, 4432])
        
        XCTAssertEqual(request.requestURL, expected)
    }
    
    func testUpdatedAfter() {
        // DateFormatter only has millisecond precision
        let expected = URL(string: "resets?updated_after=2019-03-01T18:10:34.873Z", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllResetsRequest(updatedAfter: Date.makeUTC(year: 2019, month: 3, day: 1, hour: 18, minute: 10, second: 34, microsecond: 873542))
        
        XCTAssertEqual(request.requestURL, expected)
    }
}
