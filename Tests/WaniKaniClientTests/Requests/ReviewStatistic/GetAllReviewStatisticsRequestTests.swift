import XCTest
@testable import WaniKaniClient

final class GetAllReviewStatisticsRequestTests: XCTestCase {
    private let baseURL = URL(string: "https://api.wanikani.com/v2/")!
    
    func testNoParams() {
        let expected = URL(string: "review_statistics", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllReviewStatisticsRequest()
        
        XCTAssertEqual(request.url, expected)
    }
    
    func testHidden() {
        let expected = URL(string: "review_statistics?hidden=true", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllReviewStatisticsRequest(isHidden: true)
        
        XCTAssertEqual(request.url, expected)
    }
    
    func testIDs() {
        let expected = URL(string: "review_statistics?ids=79854763,80653472", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllReviewStatisticsRequest(ids: [79_854_763, 80_653_472])
        
        XCTAssertEqual(request.url, expected)
    }
    
    func testPercentagesGreaterThan() {
        let expected = URL(string: "review_statistics?percentages_greater_than=84", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllReviewStatisticsRequest(percentagesGreaterThan: 84)
        
        XCTAssertEqual(request.url, expected)
    }
    
    func testPercentagesLessThan() {
        let expected = URL(string: "review_statistics?percentages_less_than=30", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllReviewStatisticsRequest(percentagesLessThan: 30)
        
        XCTAssertEqual(request.url, expected)
    }
    
    func testSubjectIDs() {
        let expected = URL(string: "review_statistics?subject_ids=1,243,440", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllReviewStatisticsRequest(subjectIDs: [1, 243, 440])
        
        XCTAssertEqual(request.url, expected)
    }
    
    func testSubjectTypes() {
        let expected = URL(string: "review_statistics?subject_types=radical,kanji", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllReviewStatisticsRequest(subjectTypes: [.radical, .kanji])
        
        XCTAssertEqual(request.url, expected)
    }
    
    func testUpdatedAfter() {
        // DateFormatter only has millisecond precision
        let expected = URL(string: "review_statistics?updated_after=2019-03-01T18:10:34.873Z", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllReviewStatisticsRequest(updatedAfter: Date.makeUTC(year: 2019, month: 3, day: 1, hour: 18, minute: 10, second: 34, microsecond: 873542))
        
        XCTAssertEqual(request.url, expected)
    }
}
