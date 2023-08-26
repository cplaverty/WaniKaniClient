import XCTest
@testable import WaniKaniClient

final class UpdateUserRequestTests: XCTestCase {
    private let baseURL = URL(string: "https://api.wanikani.com/v2/")!
    
    func testWithDefaultVoiceActorID() throws {
        let encoder = ResourceEncoder()
        
        let expectedURL = URL(string: "user", relativeTo: baseURL)!.absoluteURL
        let expectedHTTPMethod = "PUT"
        let expectedBodyContent = #"{"user":{"preferences":{"default_voice_actor_id":1}}}"#
        
        let request = UpdateUserRequest(preferences: UserPreferencesUpdate(defaultVoiceActorID: 1))
        let bodyContentData = try encoder.encode(request.bodyContent)
        
        XCTAssertEqual(request.requestURL, expectedURL)
        XCTAssertEqual(request.httpMethod, expectedHTTPMethod)
        let bodyContent = String(data: bodyContentData, encoding: .utf8)
        XCTAssertEqual(bodyContent, expectedBodyContent)
    }
    
    func testWithExtraStudyAutoplayAudio() throws {
        let encoder = ResourceEncoder()
        
        let expectedURL = URL(string: "user", relativeTo: baseURL)!.absoluteURL
        let expectedHTTPMethod = "PUT"
        let expectedBodyContent = #"{"user":{"preferences":{"extra_study_autoplay_audio":false}}}"#
        
        let request = UpdateUserRequest(preferences: UserPreferencesUpdate(extraStudyAutoplayAudio: false))
        let bodyContentData = try encoder.encode(request.bodyContent)
        
        XCTAssertEqual(request.requestURL, expectedURL)
        XCTAssertEqual(request.httpMethod, expectedHTTPMethod)
        let bodyContent = String(data: bodyContentData, encoding: .utf8)
        XCTAssertEqual(bodyContent, expectedBodyContent)
    }
    
    func testWithLessonsAutoplayAudio() throws {
        let encoder = ResourceEncoder()
        
        let expectedURL = URL(string: "user", relativeTo: baseURL)!.absoluteURL
        let expectedHTTPMethod = "PUT"
        let expectedBodyContent = #"{"user":{"preferences":{"lessons_autoplay_audio":true}}}"#
        
        let request = UpdateUserRequest(preferences: UserPreferencesUpdate(lessonsAutoplayAudio: true))
        let bodyContentData = try encoder.encode(request.bodyContent)
        
        XCTAssertEqual(request.requestURL, expectedURL)
        XCTAssertEqual(request.httpMethod, expectedHTTPMethod)
        let bodyContent = String(data: bodyContentData, encoding: .utf8)
        XCTAssertEqual(bodyContent, expectedBodyContent)
    }
    
    func testWithLessonsBatchSize() throws {
        let encoder = ResourceEncoder()
        
        let expectedURL = URL(string: "user", relativeTo: baseURL)!.absoluteURL
        let expectedHTTPMethod = "PUT"
        let expectedBodyContent = #"{"user":{"preferences":{"lessons_batch_size":3}}}"#
        
        let request = UpdateUserRequest(preferences: UserPreferencesUpdate(lessonsBatchSize: 3))
        let bodyContentData = try encoder.encode(request.bodyContent)
        
        XCTAssertEqual(request.requestURL, expectedURL)
        XCTAssertEqual(request.httpMethod, expectedHTTPMethod)
        let bodyContent = String(data: bodyContentData, encoding: .utf8)
        XCTAssertEqual(bodyContent, expectedBodyContent)
    }
    
    func testWithLessonsPresentationOrder() throws {
        let encoder = ResourceEncoder()
        
        let expectedURL = URL(string: "user", relativeTo: baseURL)!.absoluteURL
        let expectedHTTPMethod = "PUT"
        let expectedBodyContent = #"{"user":{"preferences":{"lessons_presentation_order":"shuffled"}}}"#
        
        let request = UpdateUserRequest(preferences: UserPreferencesUpdate(lessonsPresentationOrder: .shuffled))
        let bodyContentData = try encoder.encode(request.bodyContent)
        
        XCTAssertEqual(request.requestURL, expectedURL)
        XCTAssertEqual(request.httpMethod, expectedHTTPMethod)
        let bodyContent = String(data: bodyContentData, encoding: .utf8)
        XCTAssertEqual(bodyContent, expectedBodyContent)
    }
    
    func testWithReviewsAutoplayAudio() throws {
        let encoder = ResourceEncoder()
        
        let expectedURL = URL(string: "user", relativeTo: baseURL)!.absoluteURL
        let expectedHTTPMethod = "PUT"
        let expectedBodyContent = #"{"user":{"preferences":{"reviews_autoplay_audio":true}}}"#
        
        let request = UpdateUserRequest(preferences: UserPreferencesUpdate(reviewsAutoplayAudio: true))
        let bodyContentData = try encoder.encode(request.bodyContent)
        
        XCTAssertEqual(request.requestURL, expectedURL)
        XCTAssertEqual(request.httpMethod, expectedHTTPMethod)
        let bodyContent = String(data: bodyContentData, encoding: .utf8)
        XCTAssertEqual(bodyContent, expectedBodyContent)
    }
    
    func testWithReviewsDisplaySRSIndicator() throws {
        let encoder = ResourceEncoder()
        
        let expectedURL = URL(string: "user", relativeTo: baseURL)!.absoluteURL
        let expectedHTTPMethod = "PUT"
        let expectedBodyContent = #"{"user":{"preferences":{"reviews_display_srs_indicator":false}}}"#
        
        let request = UpdateUserRequest(preferences: UserPreferencesUpdate(reviewsDisplaySRSIndicator: false))
        let bodyContentData = try encoder.encode(request.bodyContent)
        
        XCTAssertEqual(request.requestURL, expectedURL)
        XCTAssertEqual(request.httpMethod, expectedHTTPMethod)
        let bodyContent = String(data: bodyContentData, encoding: .utf8)
        XCTAssertEqual(bodyContent, expectedBodyContent)
    }
    
    func testWithReviewsPresentationOrder() throws {
        let encoder = ResourceEncoder()
        
        let expectedURL = URL(string: "user", relativeTo: baseURL)!.absoluteURL
        let expectedHTTPMethod = "PUT"
        let expectedBodyContent = #"{"user":{"preferences":{"reviews_presentation_order":"shuffled"}}}"#
        
        let request = UpdateUserRequest(preferences: UserPreferencesUpdate(reviewsPresentationOrder: .shuffled))
        let bodyContentData = try encoder.encode(request.bodyContent)
        
        XCTAssertEqual(request.requestURL, expectedURL)
        XCTAssertEqual(request.httpMethod, expectedHTTPMethod)
        let bodyContent = String(data: bodyContentData, encoding: .utf8)
        XCTAssertEqual(bodyContent, expectedBodyContent)
    }
    
    func testAllPropsSet() throws {
        let encoder = ResourceEncoder()
        
        let expectedURL = URL(string: "user", relativeTo: baseURL)!.absoluteURL
        let expectedHTTPMethod = "PUT"
        let expectedBodyContent = #"{"user":{"preferences":{"default_voice_actor_id":1,"extra_study_autoplay_audio":false,"lessons_autoplay_audio":true,"lessons_batch_size":3,"lessons_presentation_order":"shuffled","reviews_autoplay_audio":true,"reviews_display_srs_indicator":false,"reviews_presentation_order":"shuffled"}}}"#
        
        let request = UpdateUserRequest(
            preferences: UserPreferencesUpdate(
                defaultVoiceActorID: 1,
                extraStudyAutoplayAudio: false,
                lessonsAutoplayAudio: true,
                lessonsBatchSize: 3,
                lessonsPresentationOrder: .shuffled,
                reviewsAutoplayAudio: true,
                reviewsDisplaySRSIndicator: false,
                reviewsPresentationOrder: .shuffled))
        let bodyContentData = try encoder.encode(request.bodyContent)
        
        XCTAssertEqual(request.requestURL, expectedURL)
        XCTAssertEqual(request.httpMethod, expectedHTTPMethod)
        let bodyContent = String(data: bodyContentData, encoding: .utf8)
        XCTAssertEqual(bodyContent, expectedBodyContent)
    }
}
