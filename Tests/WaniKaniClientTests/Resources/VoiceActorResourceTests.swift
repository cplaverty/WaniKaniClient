import XCTest
@testable import WaniKaniClient

final class VoiceActorResourceTests: XCTestCase {
    private let testData = """
            {"id":1,"object":"voice_actor","url":"https://api.wanikani.com/v2/voice_actors/1","data_updated_at":"2023-08-03T17:29:35.292698Z","data":{"created_at":"2018-09-11T18:30:27.096474Z","name":"Kyoko","gender":"female","description":"Tokyo accent"}}
            """.data(using: .utf8)!
    
    func testDecode() throws {
        let decoder = ResourceDecoder()
        
        let resource = try decoder.decode(VoiceActorResource.self, from: testData)
        
        let expected = VoiceActorResource(
            id: 1,
            url: URL(string: "https://api.wanikani.com/v2/voice_actors/1")!,
            dataUpdatedAt: makeUTCDate(year: 2023, month: 8, day: 3, hour: 17, minute: 29, second: 35, microsecond: 292698),
            data: VoiceActorResourceData(
                createdAt: makeUTCDate(year: 2018, month: 9, day: 11, hour: 18, minute: 30, second: 27, microsecond: 96474),
                name: "Kyoko",
                gender: .female,
                description: "Tokyo accent"))
        
        XCTAssertEqual(resource, expected)
    }
}
