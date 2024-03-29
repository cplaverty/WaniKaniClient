import XCTest
@testable import WaniKaniClient

final class GetReviewStatisticRequestTests: XCTestCase {
    private let baseURL = URL(string: "https://api.wanikani.com/v2/")!
    
    func testSmallID() {
        let expected = URL(string: "review_statistics/1", relativeTo: baseURL)!.absoluteURL
        
        let request = GetReviewStatisticRequest(id: 1)
        
        XCTAssertEqual(request.url, expected)
    }
    
    func testLargeID() {
        let expected = URL(string: "review_statistics/1234567890", relativeTo: baseURL)!.absoluteURL
        
        let request = GetReviewStatisticRequest(id: 1_234_567_890)
        
        XCTAssertEqual(request.url, expected)
    }
}
