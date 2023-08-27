import XCTest
@testable import WaniKaniClient

final class GetAllSpacedRepetitionSystemsRequestTests: XCTestCase {
    private let baseURL = URL(string: "https://api.wanikani.com/v2/")!
    
    func testNoParams() {
        let expected = URL(string: "spaced_repetition_systems", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllSpacedRepetitionSystemsRequest()
        
        XCTAssertEqual(request.url, expected)
    }
    
    func testIDs() {
        let expected = URL(string: "spaced_repetition_systems?ids=1,2", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllSpacedRepetitionSystemsRequest(ids: [1, 2])
        
        XCTAssertEqual(request.url, expected)
    }
    
    func testUpdatedAfter() {
        // DateFormatter only has millisecond precision
        let expected = URL(string: "spaced_repetition_systems?updated_after=2021-03-01T18:10:34.873Z", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllSpacedRepetitionSystemsRequest(updatedAfter: Date.makeUTC(year: 2021, month: 3, day: 1, hour: 18, minute: 10, second: 34, microsecond: 873542))
        
        XCTAssertEqual(request.url, expected)
    }
}
