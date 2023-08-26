import XCTest
@testable import WaniKaniClient

final class CreateStudyMaterialRequestTests: XCTestCase {
    private let baseURL = URL(string: "https://api.wanikani.com/v2/")!
    
    func testWithMeaningNote() throws {
        let encoder = ResourceEncoder()
        
        let expectedURL = URL(string: "study_materials", relativeTo: baseURL)!.absoluteURL
        let expectedHTTPMethod = "POST"
        let expectedBodyContent = #"{"study_material":{"meaning_note":"meaning note","subject_id":440}}"#
        
        let request = CreateStudyMaterialRequest(
            subjectID: 440,
            meaningNote: "meaning note")
        let bodyContentData = try encoder.encode(request.bodyContent)
        
        XCTAssertEqual(request.requestURL, expectedURL)
        XCTAssertEqual(request.httpMethod, expectedHTTPMethod)
        let bodyContent = String(data: bodyContentData, encoding: .utf8)
        XCTAssertEqual(bodyContent, expectedBodyContent)
    }
    
    func testWithReadingNote() throws {
        let encoder = ResourceEncoder()
        
        let expectedURL = URL(string: "study_materials", relativeTo: baseURL)!.absoluteURL
        let expectedHTTPMethod = "POST"
        let expectedBodyContent = #"{"study_material":{"reading_note":"reading note","subject_id":440}}"#
        
        let request = CreateStudyMaterialRequest(
            subjectID: 440,
            readingNote: "reading note")
        let bodyContentData = try encoder.encode(request.bodyContent)
        
        XCTAssertEqual(request.requestURL, expectedURL)
        XCTAssertEqual(request.httpMethod, expectedHTTPMethod)
        let bodyContent = String(data: bodyContentData, encoding: .utf8)
        XCTAssertEqual(bodyContent, expectedBodyContent)
    }
    
    func testWithMeaningSynonyms() throws {
        let encoder = ResourceEncoder()
        
        let expectedURL = URL(string: "study_materials", relativeTo: baseURL)!.absoluteURL
        let expectedHTTPMethod = "POST"
        let expectedBodyContent = #"{"study_material":{"meaning_synonyms":["synonym 1","synonym 2"],"subject_id":440}}"#
        
        let request = CreateStudyMaterialRequest(
            subjectID: 440,
            meaningSynonyms: ["synonym 1", "synonym 2"])
        let bodyContentData = try encoder.encode(request.bodyContent)
        
        XCTAssertEqual(request.requestURL, expectedURL)
        XCTAssertEqual(request.httpMethod, expectedHTTPMethod)
        let bodyContent = String(data: bodyContentData, encoding: .utf8)
        XCTAssertEqual(bodyContent, expectedBodyContent)
    }
    
    func testAllPropsSet() throws {
        let encoder = ResourceEncoder()
        
        let expectedURL = URL(string: "study_materials", relativeTo: baseURL)!.absoluteURL
        let expectedHTTPMethod = "POST"
        let expectedBodyContent = #"{"study_material":{"meaning_note":"meaning note","meaning_synonyms":["synonym 1","synonym 2"],"reading_note":"reading note","subject_id":440}}"#
        
        let request = CreateStudyMaterialRequest(
            subjectID: 440,
            meaningNote: "meaning note",
            readingNote: "reading note",
            meaningSynonyms: ["synonym 1", "synonym 2"])
        let bodyContentData = try encoder.encode(request.bodyContent)
        
        XCTAssertEqual(request.requestURL, expectedURL)
        XCTAssertEqual(request.httpMethod, expectedHTTPMethod)
        let bodyContent = String(data: bodyContentData, encoding: .utf8)
        XCTAssertEqual(bodyContent, expectedBodyContent)
    }
}
