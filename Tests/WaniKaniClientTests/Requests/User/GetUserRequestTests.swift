import XCTest
@testable import WaniKaniClient

final class GetUserRequestTests: XCTestCase {
    private let baseURL = URL(string: "https://api.wanikani.com/v2/")!
    
    func testNoParams() {
        let expected = URL(string: "user", relativeTo: baseURL)!.absoluteURL
        
        let request = GetUserRequest()
        let url = request.requestURL
        
        XCTAssertEqual(url, expected)
    }
}
