import XCTest
@testable import WaniKaniClient

final class ReviewStatisticTests: XCTestCase {
    private let testData = """
            {"id":30215722,"object":"review_statistic","url":"https://api.wanikani.com/v2/review_statistics/30215722","data_updated_at":"2017-05-17T18:10:45.384058Z","data":{"created_at":"2015-07-09T18:08:16.965550Z","subject_id":450,"subject_type":"kanji","meaning_correct":11,"meaning_incorrect":0,"meaning_max_streak":11,"meaning_current_streak":11,"reading_correct":11,"reading_incorrect":1,"reading_max_streak":7,"reading_current_streak":4,"percentage_correct":96,"hidden":false}}
            """.data(using: .utf8)!
    
    func testDecode() throws {
        let decoder = ResourceDecoder()
        
        let resource = try decoder.decode(ReviewStatistic.self, from: testData)
        
        let expected = ReviewStatistic(id: 30215722,
                                       url: URL(string: "https://api.wanikani.com/v2/review_statistics/30215722")!,
                                       dataUpdatedAt: makeUTCDate(year: 2017, month: 5, day: 17, hour: 18, minute: 10, second: 45, microsecond: 384058),
                                       data: ReviewStatisticData(createdAt: makeUTCDate(year: 2015, month: 7, day: 9, hour: 18, minute: 8, second: 16, microsecond: 965550),
                                                                 subjectID: 450,
                                                                 subjectType: .kanji,
                                                                 meaningCorrect: 11,
                                                                 meaningIncorrect: 0,
                                                                 meaningMaxStreak: 11,
                                                                 meaningCurrentStreak: 11,
                                                                 readingCorrect: 11,
                                                                 readingIncorrect: 1,
                                                                 readingMaxStreak: 7,
                                                                 readingCurrentStreak: 4,
                                                                 percentageCorrect: 96,
                                                                 isHidden: false))
        
        XCTAssertEqual(resource, expected)
    }
    
    static var allTests = [
        ("testDecode", testDecode),
    ]
}
