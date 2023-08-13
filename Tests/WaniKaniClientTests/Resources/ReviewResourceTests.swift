import XCTest
@testable import WaniKaniClient

final class ReviewResourceTests: XCTestCase {
    private let testData = """
            {"id":18039639,"object":"review","url":"https://api.wanikani.com/v2/reviews/18039639","data_updated_at":"2017-08-28T20:31:36.211731Z","data":{"created_at":"2017-08-28T20:31:36.211731Z","assignment_id":77901970,"spaced_repetition_system_id": 1,"subject_id":25,"starting_srs_stage":2,"ending_srs_stage":1,"incorrect_meaning_answers":2,"incorrect_reading_answers":0}}
            """.data(using: .utf8)!
    
    func testDecode() throws {
        let decoder = ResourceDecoder()
        
        let resource = try decoder.decode(ReviewResource.self, from: testData)
        
        let expected = ReviewResource(
            id: 18039639,
            url: URL(string: "https://api.wanikani.com/v2/reviews/18039639")!,
            dataUpdatedAt: makeUTCDate(year: 2017, month: 8, day: 28, hour: 20, minute: 31, second: 36, microsecond: 211731),
            data: ReviewResourceData(
                createdAt: makeUTCDate(year: 2017, month: 8, day: 28, hour: 20, minute: 31, second: 36, microsecond: 211731),
                assignmentID: 77901970,
                spacedRepetitionSystemID: 1,
                subjectID: 25,
                startingSRSStage: 2,
                endingSRSStage: 1,
                incorrectMeaningAnswers: 2,
                incorrectReadingAnswers: 0))
        
        XCTAssertEqual(resource, expected)
    }
}
