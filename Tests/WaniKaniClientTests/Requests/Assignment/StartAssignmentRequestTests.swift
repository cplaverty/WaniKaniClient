import XCTest
@testable import WaniKaniClient

final class StartAssignmentRequestTests: XCTestCase {
    private let baseURL = URL(string: "https://api.wanikani.com/v2/")!
    
    func testNoPropsSet() throws {
        let encoder = ResourceEncoder()
        
        let expectedURL = URL(string: "assignments/1/start", relativeTo: baseURL)!.absoluteURL
        let expectedHTTPMethod = "PUT"
        let expectedBodyContent = "{}"
        
        let request = StartAssignmentRequest(id: 1)
        let bodyContentData = try encoder.encode(request.bodyContent)
        
        XCTAssertEqual(request.url, expectedURL)
        XCTAssertEqual(request.httpMethod, expectedHTTPMethod)
        let bodyContent = String(data: bodyContentData, encoding: .utf8)
        XCTAssertEqual(bodyContent, expectedBodyContent)
    }
    
    func testAllPropsSet() throws {
        let encoder = ResourceEncoder()
        
        let expectedURL = URL(string: "assignments/1/start", relativeTo: baseURL)!.absoluteURL
        let expectedHTTPMethod = "PUT"
        let expectedBodyContent = #"{"started_at":"2023-08-14T19:15:08.764Z"}"#
        
        let request = StartAssignmentRequest(
            id: 1,
            startedAt: Date.makeUTC(year: 2023, month: 8, day: 14, hour: 19, minute: 15, second: 8, microsecond: 764623))
        let bodyContentData = try encoder.encode(request.bodyContent)
        
        XCTAssertEqual(request.url, expectedURL)
        XCTAssertEqual(request.httpMethod, expectedHTTPMethod)
        let bodyContent = String(data: bodyContentData, encoding: .utf8)
        XCTAssertEqual(bodyContent, expectedBodyContent)
    }
}
