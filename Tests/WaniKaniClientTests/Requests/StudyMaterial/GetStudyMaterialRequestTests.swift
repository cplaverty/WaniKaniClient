import XCTest
@testable import WaniKaniClient

final class GetStudyMaterialRequestTests: XCTestCase {
    private let baseURL = URL(string: "https://api.wanikani.com/v2/")!
    
    func testSmallID() {
        let expected = URL(string: "study_materials/1", relativeTo: baseURL)!.absoluteURL
        
        let request = GetStudyMaterialRequest(id: 1)
        
        XCTAssertEqual(request.requestURL, expected)
    }
    
    func testLargeID() {
        let expected = URL(string: "study_materials/1234567890", relativeTo: baseURL)!.absoluteURL
        
        let request = GetStudyMaterialRequest(id: 1_234_567_890)
        
        XCTAssertEqual(request.requestURL, expected)
    }
    
    static var allTests = [
        ("testSmallID", testSmallID),
        ("testLargeID", testLargeID),
    ]
}
