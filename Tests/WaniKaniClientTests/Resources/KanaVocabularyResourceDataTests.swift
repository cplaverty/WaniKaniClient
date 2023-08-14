import XCTest
@testable import WaniKaniClient

final class KanaVocabularyResourceDataTests: XCTestCase {
    private let testData = #"""
            {"id":9210,"object":"kana_vocabulary","url":"https://api.wanikani.com/v2/subjects/9210","data_updated_at":"2023-07-25T14:50:24.213631Z","data":{"created_at":"2023-04-24T23:52:43.457614Z","level":8,"slug":"おやつ","hidden_at":null,"document_url":"https://www.wanikani.com/vocabulary/%E3%81%8A%E3%82%84%E3%81%A4","characters":"おやつ","meanings":[{"meaning":"Snack","primary":true,"accepted_answer":true}],"auxiliary_meanings":[],"parts_of_speech":["noun"],"meaning_mnemonic":"\u003creading\u003eOh yah! Two\u003c/reading\u003e (\u003cja\u003eおやつ\u003c/ja\u003e) \u003cvocabulary\u003esnack\u003c/vocabulary\u003es, just for you. Imagine your two snacks. What are they? I bet they're delicious. Oh yah!\r\n\r\n\u003cja\u003eおやつ\u003c/ja\u003e can be anything from candy to cookies to onigiri. Basically, it's anything fairly light that’s eaten between meals.","context_sentences":[{"en":"Today I ate a muffin as a snack.","ja":"今日はおやつにマフィンを食べた。"},{"en":"Shall we take a snack break?","ja":"そろそろおやつにする？"},{"en":"Kaori's snacks are always homemade!","ja":"カオリちゃんのおやつは、いつも手作りだよ！"}],"pronunciation_audios":[{"url":"https://files.wanikani.com/w4yp5o02betioucki05lp6x78quy","metadata":{"gender":"male","source_id":44757,"pronunciation":"おやつ","voice_actor_id":2,"voice_actor_name":"Kenichi","voice_description":"Tokyo accent"},"content_type":"audio/webm"},{"url":"https://files.wanikani.com/qd82u8ijchzt196fiaoqxnv2ktmg","metadata":{"gender":"male","source_id":44757,"pronunciation":"おやつ","voice_actor_id":2,"voice_actor_name":"Kenichi","voice_description":"Tokyo accent"},"content_type":"audio/ogg"},{"url":"https://files.wanikani.com/232ivelhhbvy5uhih0ozuyyxvjla","metadata":{"gender":"male","source_id":44757,"pronunciation":"おやつ","voice_actor_id":2,"voice_actor_name":"Kenichi","voice_description":"Tokyo accent"},"content_type":"audio/mpeg"},{"url":"https://files.wanikani.com/8d1o3zi4nz6vdxyjyjgs47rmep6t","metadata":{"gender":"female","source_id":44698,"pronunciation":"おやつ","voice_actor_id":1,"voice_actor_name":"Kyoko","voice_description":"Tokyo accent"},"content_type":"audio/webm"},{"url":"https://files.wanikani.com/dsri4976w1x9qm0zfm98ck7jqwge","metadata":{"gender":"female","source_id":44698,"pronunciation":"おやつ","voice_actor_id":1,"voice_actor_name":"Kyoko","voice_description":"Tokyo accent"},"content_type":"audio/mpeg"},{"url":"https://files.wanikani.com/k1fdjcyvierz0ajmfjkxy0jjsabl","metadata":{"gender":"female","source_id":44698,"pronunciation":"おやつ","voice_actor_id":1,"voice_actor_name":"Kyoko","voice_description":"Tokyo accent"},"content_type":"audio/ogg"}],"lesson_position":0,"spaced_repetition_system_id":1}}
            """#.data(using: .utf8)!
    
    func testDecode() throws {
        let decoder = ResourceDecoder()
        
        let resource = try decoder.decode(SubjectResource.self, from: testData)
        
        let expected = SubjectResource(
            id: 9210,
            url: URL(string: "https://api.wanikani.com/v2/subjects/9210")!,
            dataUpdatedAt: Date.makeUTC(year: 2023, month: 7, day: 25, hour: 14, minute: 50, second: 24, microsecond: 213631),
            data: KanaVocabularyResourceData(
                createdAt: Date.makeUTC(year: 2023, month: 4, day: 24, hour: 23, minute: 52, second: 43, microsecond: 457614),
                level: 8,
                slug: "おやつ",
                hiddenAt: nil,
                documentURL: URL(string: "https://www.wanikani.com/vocabulary/%E3%81%8A%E3%82%84%E3%81%A4")!,
                characters: "おやつ",
                meanings: [Meaning(meaning: "Snack", isPrimary: true, isAcceptedAnswer: true)],
                auxiliaryMeanings: [],
                partsOfSpeech: ["noun"],
                meaningMnemonic: "<reading>Oh yah! Two</reading> (<ja>おやつ</ja>) <vocabulary>snack</vocabulary>s, just for you. Imagine your two snacks. What are they? I bet they're delicious. Oh yah!\r\n\r\n<ja>おやつ</ja> can be anything from candy to cookies to onigiri. Basically, it's anything fairly light that’s eaten between meals.",
                contextSentences: [
                    VocabularyContextSentence(english: "Today I ate a muffin as a snack.", japanese: "今日はおやつにマフィンを食べた。"),
                    VocabularyContextSentence(english: "Shall we take a snack break?", japanese: "そろそろおやつにする？"),
                    VocabularyContextSentence(english: "Kaori's snacks are always homemade!", japanese: "カオリちゃんのおやつは、いつも手作りだよ！")
                ],
                pronunciationAudios: [
                    VocabularyPronunciationAudio(
                        url: URL(string: "https://files.wanikani.com/w4yp5o02betioucki05lp6x78quy")!,
                        metadata: VocabularyPronunciationAudioMetadata(gender: .male, sourceID: 44757, pronunciation: "おやつ", voiceActorID: 2, voiceActorName: "Kenichi", voiceDescription: "Tokyo accent"),
                        contentType: "audio/webm"),
                    VocabularyPronunciationAudio(
                        url: URL(string: "https://files.wanikani.com/qd82u8ijchzt196fiaoqxnv2ktmg")!,
                        metadata: VocabularyPronunciationAudioMetadata(gender: .male, sourceID: 44757, pronunciation: "おやつ", voiceActorID: 2, voiceActorName: "Kenichi", voiceDescription: "Tokyo accent"),
                        contentType: "audio/ogg"),
                    VocabularyPronunciationAudio(
                        url: URL(string: "https://files.wanikani.com/232ivelhhbvy5uhih0ozuyyxvjla")!,
                        metadata: VocabularyPronunciationAudioMetadata(gender: .male, sourceID: 44757, pronunciation: "おやつ", voiceActorID: 2, voiceActorName: "Kenichi", voiceDescription: "Tokyo accent"),
                        contentType: "audio/mpeg"),
                    VocabularyPronunciationAudio(
                        url: URL(string: "https://files.wanikani.com/8d1o3zi4nz6vdxyjyjgs47rmep6t")!,
                        metadata: VocabularyPronunciationAudioMetadata(gender: .female, sourceID: 44698, pronunciation: "おやつ", voiceActorID: 1, voiceActorName: "Kyoko", voiceDescription: "Tokyo accent"),
                        contentType: "audio/webm"),
                    VocabularyPronunciationAudio(
                        url: URL(string: "https://files.wanikani.com/dsri4976w1x9qm0zfm98ck7jqwge")!,
                        metadata: VocabularyPronunciationAudioMetadata(gender: .female, sourceID: 44698, pronunciation: "おやつ", voiceActorID: 1, voiceActorName: "Kyoko", voiceDescription: "Tokyo accent"),
                        contentType: "audio/mpeg"),
                    VocabularyPronunciationAudio(
                        url: URL(string: "https://files.wanikani.com/k1fdjcyvierz0ajmfjkxy0jjsabl")!,
                        metadata: VocabularyPronunciationAudioMetadata(gender: .female, sourceID: 44698, pronunciation: "おやつ", voiceActorID: 1, voiceActorName: "Kyoko", voiceDescription: "Tokyo accent"),
                        contentType: "audio/ogg")
                ],
                lessonPosition: 0,
                spacedRepetitionSystemID: 1))
        
        XCTAssertEqual(resource, expected)
    }
}
