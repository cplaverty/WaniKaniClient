import XCTest
@testable import WaniKaniClient

final class GetAllAssignmentsRequestTests: XCTestCase {
    private let baseURL = URL(string: "https://api.wanikani.com/v2/")!
    
    func testNoParams() {
        let expected = URL(string: "assignments", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllAssignmentsRequest()
        
        XCTAssertEqual(request.url, expected)
    }
    
    func testAvailableAfter() {
        // DateFormatter only has millisecond precision
        let expected = URL(string: "assignments?available_after=2019-09-03T14:15:30.327Z", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllAssignmentsRequest(availableAfter: Date.makeUTC(year: 2019, month: 9, day: 3, hour: 14, minute: 15, second: 30, microsecond: 327509))
        
        XCTAssertEqual(request.url, expected)
    }
    
    func testAvailableBefore() {
        // DateFormatter only has millisecond precision
        let expected = URL(string: "assignments?available_before=2019-08-05T22:26:54.548Z", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllAssignmentsRequest(availableBefore: Date.makeUTC(year: 2019, month: 8, day: 5, hour: 22, minute: 26, second: 54, microsecond: 548723))
        
        XCTAssertEqual(request.url, expected)
    }
    
    func testBurned() {
        let expected = URL(string: "assignments?burned=false", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllAssignmentsRequest(isBurned: false)
        
        XCTAssertEqual(request.url, expected)
    }
    
    func testHidden() {
        let expected = URL(string: "assignments?hidden=true", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllAssignmentsRequest(isHidden: true)
        
        XCTAssertEqual(request.url, expected)
    }
    
    func testIDs() {
        let expected = URL(string: "assignments?ids=79854763,80653472", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllAssignmentsRequest(ids: [79_854_763, 80_653_472])
        
        XCTAssertEqual(request.url, expected)
    }
    
    func testImmediatelyAvailableForLessons() {
        let expected = URL(string: "assignments?immediately_available_for_lessons=true", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllAssignmentsRequest(immediatelyAvailableForLessons: true)
        
        XCTAssertEqual(request.url, expected)
    }
    
    func testImmediatelyAvailableForReview() {
        let expected = URL(string: "assignments?immediately_available_for_review=true", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllAssignmentsRequest(immediatelyAvailableForReview: true)
        
        XCTAssertEqual(request.url, expected)
    }
    
    func testInReview() {
        let expected = URL(string: "assignments?in_review=true", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllAssignmentsRequest(inReview: true)
        
        XCTAssertEqual(request.url, expected)
    }
    
    func testLevels() {
        let expected = URL(string: "assignments?levels=2,4,6,8,10", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllAssignmentsRequest(levels: [2, 4, 6, 8, 10])
        
        XCTAssertEqual(request.url, expected)
    }
    
    func testSRSStages() {
        let expected = URL(string: "assignments?srs_stages=9", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllAssignmentsRequest(srsStages: [9])
        
        XCTAssertEqual(request.url, expected)
    }
    
    func testStarted() {
        let expected = URL(string: "assignments?started=false", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllAssignmentsRequest(isStarted: false)
        
        XCTAssertEqual(request.url, expected)
    }
    
    func testSubjectIDs() {
        let expected = URL(string: "assignments?subject_ids=1,243,440", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllAssignmentsRequest(subjectIDs: [1, 243, 440])
        
        XCTAssertEqual(request.url, expected)
    }
    
    func testSubjectTypes() {
        let expected = URL(string: "assignments?subject_types=radical,kanji", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllAssignmentsRequest(subjectTypes: [.radical, .kanji])
        
        XCTAssertEqual(request.url, expected)
    }
    
    func testUnlocked() {
        let expected = URL(string: "assignments?unlocked=true", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllAssignmentsRequest(isUnlocked: true)
        
        XCTAssertEqual(request.url, expected)
    }
    
    func testUpdatedAfter() {
        // DateFormatter only has millisecond precision
        let expected = URL(string: "assignments?updated_after=2019-03-01T18:10:34.873Z", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllAssignmentsRequest(updatedAfter: Date.makeUTC(year: 2019, month: 3, day: 1, hour: 18, minute: 10, second: 34, microsecond: 873542))
        
        XCTAssertEqual(request.url, expected)
    }
}
