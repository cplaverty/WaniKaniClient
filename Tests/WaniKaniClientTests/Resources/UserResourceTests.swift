import XCTest
@testable import WaniKaniClient

final class UserResourceTests: XCTestCase {
    private let testData = """
        {"object":"user","url":"https://api.wanikani.com/v2/user","data_updated_at":"2019-06-26T19:43:27.724385Z","data":{"id":"7d1742c5-c493-444b-97ae-c495bec9d850","username":"testUser","level":24,"profile_url":"https://www.wanikani.com/users/testUser","started_at":"2014-06-12T07:40:29.462981Z","subscription":{"active":true,"type":"recurring","max_level_granted":60,"period_ends_at":"2020-06-12T07:40:29.000000Z"},"current_vacation_started_at":null,"preferences":{"lessons_batch_size":5,"default_voice_actor_id":2,"lessons_autoplay_audio":true,"reviews_autoplay_audio":true,"extra_study_autoplay_audio":false,"lessons_presentation_order":"ascending_level_then_subject","reviews_presentation_order":"shuffled","reviews_display_srs_indicator":true}}}
        """.data(using: .utf8)!
    
    func testDecode() throws {
        let decoder = ResourceDecoder()
        
        let resource = try decoder.decode(UserResource.self, from: testData)
        
        let expected = UserResource(
            url: URL(string: "https://api.wanikani.com/v2/user")!,
            dataUpdatedAt: Date.makeUTC(year: 2019, month: 6, day: 26, hour: 19, minute: 43, second: 27, microsecond: 724385),
            data: UserResourceData(
                id: "7d1742c5-c493-444b-97ae-c495bec9d850",
                username: "testUser",
                level: 24,
                profileURL: URL(string: "https://www.wanikani.com/users/testUser")!,
                startedAt: Date.makeUTC(year: 2014, month: 6, day: 12, hour: 7, minute: 40, second: 29, microsecond: 462981),
                currentVacationStartedAt: nil,
                subscription: UserSubscription(
                    isActive: true,
                    type: .recurring,
                    maxLevelGranted: 60,
                    periodEndsAt: Date.makeUTC(year: 2020, month: 6, day: 12, hour: 7, minute: 40, second: 29)),
                preferences: UserPreferences(
                    defaultVoiceActorID: 2,
                    extraStudyAutoplayAudio: false,
                    lessonsAutoplayAudio: true,
                    lessonsBatchSize: 5,
                    lessonsPresentationOrder: .ascendingLevelThenSubject,
                    reviewsAutoplayAudio: true,
                    reviewsDisplaySRSIndicator: true,
                    reviewsPresentationOrder: .shuffled)))
        
        XCTAssertEqual(resource, expected)
    }
}
