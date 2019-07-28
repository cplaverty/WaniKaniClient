import XCTest
@testable import WaniKaniClient

final class StudyMaterialResourceTests: XCTestCase {
    private let testData = """
            {"id":204431,"object":"study_material","url":"https://api.wanikani.com/v2/study_materials/204431","data_updated_at":"2017-05-13T14:36:04.493113Z","data":{"created_at":"2015-07-07T16:41:02.579373Z","subject_id":25,"subject_type":"radical","meaning_note":"meaning note","reading_note":"reading note","meaning_synonyms":["industry"],"hidden":false}}
            """.data(using: .utf8)!
    
    func testDecode() throws {
        let decoder = ResourceDecoder()
        
        let resource = try decoder.decode(StudyMaterialResource.self, from: testData)
        
        let expected = StudyMaterialResource(
            id: 204431,
            url: URL(string: "https://api.wanikani.com/v2/study_materials/204431")!,
            dataUpdatedAt: makeUTCDate(year: 2017, month: 5, day: 13, hour: 14, minute: 36, second: 4, microsecond: 493113),
            data: StudyMaterialResourceData(
                createdAt: makeUTCDate(year: 2015, month: 7, day: 7, hour: 16, minute: 41, second: 2, microsecond: 579373),
                subjectID: 25,
                subjectType: .radical,
                meaningNote: "meaning note",
                readingNote: "reading note",
                meaningSynonyms: ["industry"],
                isHidden: false))
        
        XCTAssertEqual(resource, expected)
    }
    
    static var allTests = [
        ("testDecode", testDecode),
    ]
}
