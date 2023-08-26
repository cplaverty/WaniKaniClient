import XCTest
@testable import WaniKaniClient

final class ReviewResourceTests: XCTestCase {
    func testDecode() throws {
        let testData = """
            {"id":18039639,"object":"review","url":"https://api.wanikani.com/v2/reviews/18039639","data_updated_at":"2017-08-28T20:31:36.211731Z","data":{"created_at":"2017-08-28T20:31:36.211731Z","assignment_id":77901970,"spaced_repetition_system_id": 1,"subject_id":25,"starting_srs_stage":2,"ending_srs_stage":1,"incorrect_meaning_answers":2,"incorrect_reading_answers":0}}
            """.data(using: .utf8)!
        
        let expected = ReviewResource(
            id: 18039639,
            url: URL(string: "https://api.wanikani.com/v2/reviews/18039639")!,
            dataUpdatedAt: Date.makeUTC(year: 2017, month: 8, day: 28, hour: 20, minute: 31, second: 36, microsecond: 211731),
            data: ReviewResourceData(
                createdAt: Date.makeUTC(year: 2017, month: 8, day: 28, hour: 20, minute: 31, second: 36, microsecond: 211731),
                assignmentID: 77901970,
                spacedRepetitionSystemID: 1,
                subjectID: 25,
                startingSRSStage: 2,
                endingSRSStage: 1,
                incorrectMeaningAnswers: 2,
                incorrectReadingAnswers: 0))
        
        let resource = try ResourceDecoder.shared.decode(ReviewResource.self, from: testData)
        
        XCTAssertEqual(resource, expected)
    }
    
    func testRoundTrip() throws {
        let expected = ReviewResource(
            id: 18039639,
            url: URL(string: "https://api.wanikani.com/v2/reviews/18039639")!,
            dataUpdatedAt: Date.makeUTC(year: 2017, month: 8, day: 28, hour: 20, minute: 31, second: 36, microsecond: 211731),
            data: ReviewResourceData(
                createdAt: Date.makeUTC(year: 2017, month: 8, day: 28, hour: 20, minute: 31, second: 36, microsecond: 211731),
                assignmentID: 77901970,
                spacedRepetitionSystemID: 1,
                subjectID: 25,
                startingSRSStage: 2,
                endingSRSStage: 1,
                incorrectMeaningAnswers: 2,
                incorrectReadingAnswers: 0))
        
        let encoded = try ResourceEncoder.shared.encode(expected)
        let decoded = try ResourceDecoder.shared.decode(ReviewResource.self, from: encoded)
        
        XCTAssertEqual(decoded, expected)
    }
}
