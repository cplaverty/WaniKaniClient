import XCTest
@testable import WaniKaniClient

final class GetResetRequestTests: XCTestCase {
    private let baseURL = URL(string: "https://api.wanikani.com/v2/")!
    
    func testSmallID() {
        let expected = URL(string: "resets/1", relativeTo: baseURL)!.absoluteURL
        
        let request = GetResetRequest(id: 1)
        
        XCTAssertEqual(request.requestURL, expected)
    }
    
    func testLargeID() {
        let expected = URL(string: "resets/1234567890", relativeTo: baseURL)!.absoluteURL
        
        let request = GetResetRequest(id: 1_234_567_890)
        
        XCTAssertEqual(request.requestURL, expected)
    }
}
