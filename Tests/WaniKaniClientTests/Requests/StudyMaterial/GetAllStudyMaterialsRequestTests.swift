import XCTest
@testable import WaniKaniClient

final class GetAllStudyMaterialsRequestTests: XCTestCase {
    private let baseURL = URL(string: "https://api.wanikani.com/v2/")!
    
    func testNoParams() {
        let expected = URL(string: "study_materials", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllStudyMaterialsRequest()
        
        XCTAssertEqual(request.url, expected)
    }
    
    func testHidden() {
        let expected = URL(string: "study_materials?hidden=true", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllStudyMaterialsRequest(isHidden: true)
        
        XCTAssertEqual(request.url, expected)
    }
    
    func testIDs() {
        let expected = URL(string: "study_materials?ids=79854763,80653472", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllStudyMaterialsRequest(ids: [79_854_763, 80_653_472])
        
        XCTAssertEqual(request.url, expected)
    }
    
    func testSubjectIDs() {
        let expected = URL(string: "study_materials?subject_ids=1,243,440", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllStudyMaterialsRequest(subjectIDs: [1, 243, 440])
        
        XCTAssertEqual(request.url, expected)
    }
    
    func testSubjectTypes() {
        let expected = URL(string: "study_materials?subject_types=radical,kanji", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllStudyMaterialsRequest(subjectTypes: [.radical, .kanji])
        
        XCTAssertEqual(request.url, expected)
    }
    
    func testUpdatedAfter() {
        // DateFormatter only has millisecond precision
        let expected = URL(string: "study_materials?updated_after=2019-03-01T18:10:34.873Z", relativeTo: baseURL)!.absoluteURL
        
        let request = GetAllStudyMaterialsRequest(updatedAfter: Date.makeUTC(year: 2019, month: 3, day: 1, hour: 18, minute: 10, second: 34, microsecond: 873542))
        
        XCTAssertEqual(request.url, expected)
    }
}
