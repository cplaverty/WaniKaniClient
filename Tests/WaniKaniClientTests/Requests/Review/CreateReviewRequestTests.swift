import XCTest
@testable import WaniKaniClient

final class CreateReviewRequestTests: XCTestCase {
    private let baseURL = URL(string: "https://api.wanikani.com/v2/")!
    
    func testWithAssignmentID() throws {
        let encoder = ResourceEncoder()
        
        let expectedURL = URL(string: "reviews", relativeTo: baseURL)!.absoluteURL
        let expectedHTTPMethod = "POST"
        let expectedBodyContent = #"{"review":{"assignment_id":1422,"incorrect_meaning_answers":1,"incorrect_reading_answers":2}}"#
        
        let request = CreateReviewRequest(
            assignmentID: 1422,
            incorrectMeaningAnswers: 1,
            incorrectReadingAnswers: 2)
        let bodyContentData = try encoder.encode(request.bodyContent)
        
        XCTAssertEqual(request.url, expectedURL)
        XCTAssertEqual(request.httpMethod, expectedHTTPMethod)
        let bodyContent = String(data: bodyContentData, encoding: .utf8)
        XCTAssertEqual(bodyContent, expectedBodyContent)
    }
    
    func testWithAssignmentIDAndCreatedAt() throws {
        let encoder = ResourceEncoder()
        
        let expectedURL = URL(string: "reviews", relativeTo: baseURL)!.absoluteURL
        let expectedHTTPMethod = "POST"
        let expectedBodyContent = #"{"review":{"assignment_id":1422,"created_at":"2017-09-30T01:42:13.453Z","incorrect_meaning_answers":1,"incorrect_reading_answers":2}}"#
        
        let request = CreateReviewRequest(
            assignmentID: 1422,
            incorrectMeaningAnswers: 1,
            incorrectReadingAnswers: 2,
            createdAt: Date.makeUTC(year: 2017, month: 9, day: 30, hour: 1, minute: 42, second: 13, microsecond: 453291))
        let bodyContentData = try encoder.encode(request.bodyContent)
        
        XCTAssertEqual(request.url, expectedURL)
        XCTAssertEqual(request.httpMethod, expectedHTTPMethod)
        let bodyContent = String(data: bodyContentData, encoding: .utf8)
        XCTAssertEqual(bodyContent, expectedBodyContent)
    }
    
    func testWithSubjectID() throws {
        let encoder = ResourceEncoder()
        
        let expectedURL = URL(string: "reviews", relativeTo: baseURL)!.absoluteURL
        let expectedHTTPMethod = "POST"
        let expectedBodyContent = #"{"review":{"incorrect_meaning_answers":1,"incorrect_reading_answers":0,"subject_id":440}}"#
        
        let request = CreateReviewRequest(
            subjectID: 440,
            incorrectMeaningAnswers: 1,
            incorrectReadingAnswers: 0)
        let bodyContentData = try encoder.encode(request.bodyContent)
        
        XCTAssertEqual(request.url, expectedURL)
        XCTAssertEqual(request.httpMethod, expectedHTTPMethod)
        let bodyContent = String(data: bodyContentData, encoding: .utf8)
        XCTAssertEqual(bodyContent, expectedBodyContent)
    }
    
    func testWithSubjectIDAndCreatedAt() throws {
        let encoder = ResourceEncoder()
        
        let expectedURL = URL(string: "reviews", relativeTo: baseURL)!.absoluteURL
        let expectedHTTPMethod = "POST"
        let expectedBodyContent = #"{"review":{"created_at":"2017-09-30T01:42:13.453Z","incorrect_meaning_answers":1,"incorrect_reading_answers":0,"subject_id":440}}"#
        
        let request = CreateReviewRequest(
            subjectID: 440,
            incorrectMeaningAnswers: 1,
            incorrectReadingAnswers: 0,
            createdAt: Date.makeUTC(year: 2017, month: 9, day: 30, hour: 1, minute: 42, second: 13, microsecond: 453291))
        let bodyContentData = try encoder.encode(request.bodyContent)
        
        XCTAssertEqual(request.url, expectedURL)
        XCTAssertEqual(request.httpMethod, expectedHTTPMethod)
        let bodyContent = String(data: bodyContentData, encoding: .utf8)
        XCTAssertEqual(bodyContent, expectedBodyContent)
    }
}
