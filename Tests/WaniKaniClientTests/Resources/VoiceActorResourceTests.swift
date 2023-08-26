import XCTest
@testable import WaniKaniClient

final class VoiceActorResourceTests: XCTestCase {
    func testDecode() throws {
        let testData = """
            {"id":1,"object":"voice_actor","url":"https://api.wanikani.com/v2/voice_actors/1","data_updated_at":"2023-08-03T17:29:35.292698Z","data":{"created_at":"2018-09-11T18:30:27.096474Z","name":"Kyoko","gender":"female","description":"Tokyo accent"}}
            """.data(using: .utf8)!
        
        let expected = VoiceActorResource(
            id: 1,
            url: URL(string: "https://api.wanikani.com/v2/voice_actors/1")!,
            dataUpdatedAt: Date.makeUTC(year: 2023, month: 8, day: 3, hour: 17, minute: 29, second: 35, microsecond: 292698),
            data: VoiceActorResourceData(
                createdAt: Date.makeUTC(year: 2018, month: 9, day: 11, hour: 18, minute: 30, second: 27, microsecond: 96474),
                name: "Kyoko",
                gender: .female,
                description: "Tokyo accent"))
        
        let resource = try ResourceDecoder.shared.decode(VoiceActorResource.self, from: testData)
        
        XCTAssertEqual(resource, expected)
    }
    
    func testRoundTrip() throws {
        let expected = VoiceActorResource(
            id: 1,
            url: URL(string: "https://api.wanikani.com/v2/voice_actors/1")!,
            dataUpdatedAt: Date.makeUTC(year: 2023, month: 8, day: 3, hour: 17, minute: 29, second: 35, microsecond: 292698),
            data: VoiceActorResourceData(
                createdAt: Date.makeUTC(year: 2018, month: 9, day: 11, hour: 18, minute: 30, second: 27, microsecond: 96474),
                name: "Kyoko",
                gender: .female,
                description: "Tokyo accent"))
        
        let encoded = try ResourceEncoder.shared.encode(expected)
        let decoded = try ResourceDecoder.shared.decode(VoiceActorResource.self, from: encoded)
        
        XCTAssertEqual(decoded, expected)
    }
}
