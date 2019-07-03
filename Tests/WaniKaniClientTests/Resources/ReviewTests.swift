import XCTest
@testable import WaniKaniClient

final class ReviewTests: XCTestCase {
    private let testData = """
            {"id":18039639,"object":"review","url":"https://api.wanikani.com/v2/reviews/18039639","data_updated_at":"2017-08-28T20:31:36.211731Z","data":{"created_at":"2017-08-28T20:31:36.211731Z","assignment_id":77901970,"subject_id":25,"starting_srs_stage":1,"starting_srs_stage_name":"Apprentice I","ending_srs_stage":1,"ending_srs_stage_name":"Apprentice I","incorrect_meaning_answers":2,"incorrect_reading_answers":0}}
            """.data(using: .utf8)!
    
    func testDecode() throws {
        let decoder = ResourceDecoder()
        
        let resource = try decoder.decode(Review.self, from: testData)
        
        let expected = Review(id: 18039639,
                              url: URL(string: "https://api.wanikani.com/v2/reviews/18039639")!,
                              dataUpdatedAt: makeUTCDate(year: 2017, month: 8, day: 28, hour: 20, minute: 31, second: 36, microsecond: 211731),
                              data: ReviewData(createdAt: makeUTCDate(year: 2017, month: 8, day: 28, hour: 20, minute: 31, second: 36, microsecond: 211731),
                                               assignmentID: 77901970,
                                               subjectID: 25,
                                               startingSRSStage: 1,
                                               startingSRSStageName: "Apprentice I",
                                               endingSRSStage: 1,
                                               endingSRSStageName: "Apprentice I",
                                               incorrectMeaningAnswers: 2,
                                               incorrectReadingAnswers: 0))
        
        XCTAssertEqual(resource, expected)
    }
    
    static var allTests = [
        ("testDecode", testDecode),
    ]
}
