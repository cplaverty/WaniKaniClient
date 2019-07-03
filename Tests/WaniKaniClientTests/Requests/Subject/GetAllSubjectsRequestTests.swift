import XCTest
@testable import WaniKaniClient

final class GetAllSubjectsRequestTests: XCTestCase {
    private let baseURL = URL(string: "https://api.wanikani.com/v2/")!
    
    func testNoParams() {
        let expected = URL(string: "subjects", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllSubjectsRequest()
        
        XCTAssertEqual(request.requestURL, expected)
    }
    
    func testIDsSingle() {
        let expected = URL(string: "subjects?ids=110", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllSubjectsRequest(ids: [110])
        
        XCTAssertEqual(request.requestURL, expected)
    }
    
    func testIDsMultiple() {
        let expected = URL(string: "subjects?ids=1,243,440", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllSubjectsRequest(ids: [1, 243, 440])
        
        XCTAssertEqual(request.requestURL, expected)
    }
    
    func testTypes() {
        let expected = URL(string: "subjects?types=radical,kanji", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllSubjectsRequest(types: [.radical, .kanji])
        
        XCTAssertEqual(request.requestURL, expected)
    }
    
    func testSlugs() {
        let expected = URL(string: "subjects?slugs=tree,ground,river", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllSubjectsRequest(slugs: ["tree", "ground", "river"])
        
        XCTAssertEqual(request.requestURL, expected)
    }
    
    func testLevels() {
        let expected = URL(string: "subjects?levels=2,4,6,8,10", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllSubjectsRequest(levels: [2, 4, 6, 8, 10])
        
        XCTAssertEqual(request.requestURL, expected)
    }
    
    func testHidden() {
        let expected = URL(string: "subjects?hidden=true", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllSubjectsRequest(isHidden: true)
        
        XCTAssertEqual(request.requestURL, expected)
    }
    
    func testUpdatedAfter() {
        // DateFormatter only has millisecond precision
        let expected = URL(string: "subjects?updated_after=2019-03-01T18:10:34.873000Z", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllSubjectsRequest(updatedAfter: makeUTCDate(year: 2019, month: 3, day: 1, hour: 18, minute: 10, second: 34, microsecond: 873542))
        
        XCTAssertEqual(request.requestURL, expected)
    }
    
    static var allTests = [
        ("testNoParams", testNoParams),
        ("testIDsSingle", testIDsSingle),
        ("testIDsMultiple", testIDsMultiple),
        ("testTypes", testTypes),
        ("testSlugs", testSlugs),
        ("testLevels", testLevels),
        ("testHidden", testHidden),
        ("testUpdatedAfter", testUpdatedAfter),
    ]
}
