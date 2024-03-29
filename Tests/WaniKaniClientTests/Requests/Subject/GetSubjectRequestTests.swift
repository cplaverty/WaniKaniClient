import XCTest
@testable import WaniKaniClient

final class GetSubjectRequestTests: XCTestCase {
    private let baseURL = URL(string: "https://api.wanikani.com/v2/")!
    
    func testSmallID() {
        let expected = URL(string: "subjects/1", relativeTo: baseURL)!.absoluteURL
        
        let request = GetSubjectRequest(id: 1)
        
        XCTAssertEqual(request.url, expected)
    }
    
    func testLargeID() {
        let expected = URL(string: "subjects/1234567890", relativeTo: baseURL)!.absoluteURL
        
        let request = GetSubjectRequest(id: 1_234_567_890)
        
        XCTAssertEqual(request.url, expected)
    }
}
