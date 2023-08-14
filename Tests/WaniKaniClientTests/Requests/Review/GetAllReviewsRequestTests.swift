import XCTest
@testable import WaniKaniClient

final class GetAllReviewsRequestTests: XCTestCase {
    private let baseURL = URL(string: "https://api.wanikani.com/v2/")!
    
    func testNoParams() {
        let expected = URL(string: "reviews", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllReviewsRequest()
        
        XCTAssertEqual(request.requestURL, expected)
    }
    
    func testAssignmentIDs() {
        let expected = URL(string: "reviews?assignment_ids=79854763,80653472", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllReviewsRequest(assignmentIDs: [79_854_763, 80_653_472])
        
        XCTAssertEqual(request.requestURL, expected)
    }
    
    func testIDs() {
        let expected = URL(string: "reviews?ids=3887,3943,4234,4432", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllReviewsRequest(ids: [3887, 3943, 4234, 4432])
        
        XCTAssertEqual(request.requestURL, expected)
    }
    
    func testSubjectIDs() {
        let expected = URL(string: "reviews?subject_ids=1,243,440", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllReviewsRequest(subjectIDs: [1, 243, 440])
        
        XCTAssertEqual(request.requestURL, expected)
    }
    
    func testUpdatedAfter() {
        // DateFormatter only has millisecond precision
        let expected = URL(string: "reviews?updated_after=2019-03-01T18:10:34.873Z", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllReviewsRequest(updatedAfter: Date.makeUTC(year: 2019, month: 3, day: 1, hour: 18, minute: 10, second: 34, microsecond: 873542))
        
        XCTAssertEqual(request.requestURL, expected)
    }
}
