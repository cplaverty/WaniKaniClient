import XCTest
@testable import WaniKaniClient

final class VocabularyResourceDataTests: XCTestCase {
    private let testData = #"""
            {"id":2467,"object":"vocabulary","url":"https://api.wanikani.com/v2/subjects/2467","data_updated_at":"2023-08-12T05:05:10.904541Z","data":{"created_at":"2012-02-28T08:04:47.000000Z","level":1,"slug":"一","hidden_at":null,"document_url":"https://www.wanikani.com/vocabulary/%E4%B8%80","characters":"一","meanings":[{"meaning":"One","primary":true,"accepted_answer":true}],"auxiliary_meanings":[{"type":"whitelist","meaning":"1"}],"readings":[{"primary":true,"reading":"いち","accepted_answer":true}],"parts_of_speech":["numeral"],"component_subject_ids":[440],"meaning_mnemonic":"As is the case with most vocab words that consist of a single kanji, this vocab word has the same meaning as the kanji it parallels, which is \u003cvocabulary\u003eone\u003c/vocabulary\u003e.","reading_mnemonic":"When a vocab word is all alone and has no okurigana (hiragana attached to kanji) connected to it, it usually uses the kun'yomi reading. Numbers are an exception, however. When a number is all alone, with no kanji or okurigana, it is going to be the on'yomi reading, which you learned with the kanji.  Just remember this exception for alone numbers and you'll be able to read future number-related vocab to come.","context_sentences":[{"en":"This lemon weighs a kilogram!? That's big!","ja":"このレモン、一キログラム！？大きいですね！"},{"en":"It's level 1.","ja":"レベル一です。"},{"en":"This is the largest size melon in the United States.","ja":"このメロンはアメリカ一の大きさです。"}],"pronunciation_audios":[{"url":"https://files.wanikani.com/xzymh7gye9b6p59oqtgtahxwcfw7","metadata":{"gender":"male","source_id":2711,"pronunciation":"いち","voice_actor_id":2,"voice_actor_name":"Kenichi","voice_description":"Tokyo accent"},"content_type":"audio/webm"},{"url":"https://files.wanikani.com/62jun2mak5sp5eh8hccy8epfsocg","metadata":{"gender":"male","source_id":2711,"pronunciation":"いち","voice_actor_id":2,"voice_actor_name":"Kenichi","voice_description":"Tokyo accent"},"content_type":"audio/ogg"},{"url":"https://files.wanikani.com/hh8gc6v9iurvaz61fuyub817bw5q","metadata":{"gender":"female","source_id":21630,"pronunciation":"いち","voice_actor_id":1,"voice_actor_name":"Kyoko","voice_description":"Tokyo accent"},"content_type":"audio/webm"},{"url":"https://files.wanikani.com/giaqri5u6zr5i96kkthbbnvhj4qt","metadata":{"gender":"female","source_id":21630,"pronunciation":"いち","voice_actor_id":1,"voice_actor_name":"Kyoko","voice_description":"Tokyo accent"},"content_type":"audio/mpeg"},{"url":"https://files.wanikani.com/9lzgz496ba6xeuj78icwqd9fzu4p","metadata":{"gender":"female","source_id":21630,"pronunciation":"いち","voice_actor_id":1,"voice_actor_name":"Kyoko","voice_description":"Tokyo accent"},"content_type":"audio/ogg"},{"url":"https://files.wanikani.com/v6a1op509bhemf3fgsi6z07yw6o0","metadata":{"gender":"male","source_id":2711,"pronunciation":"いち","voice_actor_id":2,"voice_actor_name":"Kenichi","voice_description":"Tokyo accent"},"content_type":"audio/mpeg"}],"lesson_position":44,"spaced_repetition_system_id":2}}
            """#.data(using: .utf8)!
    
    func testDecode() throws {
        let decoder = ResourceDecoder()
        
        let resource = try decoder.decode(SubjectResource.self, from: testData)
        
        let expected = SubjectResource(
            id: 2467,
            url: URL(string: "https://api.wanikani.com/v2/subjects/2467")!,
            dataUpdatedAt: Date.makeUTC(year: 2023, month: 8, day: 12, hour: 5, minute: 5, second: 10, microsecond: 904541),
            data: VocabularyResourceData(
                createdAt: Date.makeUTC(year: 2012, month: 2, day: 28, hour: 8, minute: 4, second: 47),
                level: 1,
                slug: "一",
                hiddenAt: nil,
                documentURL: URL(string: "https://www.wanikani.com/vocabulary/%E4%B8%80")!,
                characters: "一",
                meanings: [Meaning(meaning: "One", isPrimary: true, isAcceptedAnswer: true)],
                auxiliaryMeanings: [AuxiliaryMeaning(type: .whitelist, meaning: "1")],
                readings: [VocabularyReading(reading: "いち", isPrimary: true, isAcceptedAnswer: true)],
                partsOfSpeech: ["numeral"],
                componentSubjectIDs: [440],
                meaningMnemonic: "As is the case with most vocab words that consist of a single kanji, this vocab word has the same meaning as the kanji it parallels, which is <vocabulary>one</vocabulary>.",
                readingMnemonic: "When a vocab word is all alone and has no okurigana (hiragana attached to kanji) connected to it, it usually uses the kun'yomi reading. Numbers are an exception, however. When a number is all alone, with no kanji or okurigana, it is going to be the on'yomi reading, which you learned with the kanji.  Just remember this exception for alone numbers and you'll be able to read future number-related vocab to come.",
                contextSentences: [
                    VocabularyContextSentence(english: "This lemon weighs a kilogram!? That's big!", japanese: "このレモン、一キログラム！？大きいですね！"),
                    VocabularyContextSentence(english: "It's level 1.", japanese: "レベル一です。"),
                    VocabularyContextSentence(english: "This is the largest size melon in the United States.", japanese: "このメロンはアメリカ一の大きさです。")
                ],
                pronunciationAudios: [
                    VocabularyPronunciationAudio(
                        url: URL(string: "https://files.wanikani.com/xzymh7gye9b6p59oqtgtahxwcfw7")!,
                        metadata: VocabularyPronunciationAudioMetadata(gender: .male, sourceID: 2711, pronunciation: "いち", voiceActorID: 2, voiceActorName: "Kenichi", voiceDescription: "Tokyo accent"),
                        contentType: "audio/webm"),
                    VocabularyPronunciationAudio(
                        url: URL(string: "https://files.wanikani.com/62jun2mak5sp5eh8hccy8epfsocg")!,
                        metadata: VocabularyPronunciationAudioMetadata(gender: .male, sourceID: 2711, pronunciation: "いち", voiceActorID: 2, voiceActorName: "Kenichi", voiceDescription: "Tokyo accent"),
                        contentType: "audio/ogg"),
                    VocabularyPronunciationAudio(
                        url: URL(string: "https://files.wanikani.com/hh8gc6v9iurvaz61fuyub817bw5q")!,
                        metadata: VocabularyPronunciationAudioMetadata(gender: .female, sourceID: 21630, pronunciation: "いち", voiceActorID: 1, voiceActorName: "Kyoko", voiceDescription: "Tokyo accent"),
                        contentType: "audio/webm"),
                    VocabularyPronunciationAudio(
                        url: URL(string: "https://files.wanikani.com/giaqri5u6zr5i96kkthbbnvhj4qt")!,
                        metadata: VocabularyPronunciationAudioMetadata(gender: .female, sourceID: 21630, pronunciation: "いち", voiceActorID: 1, voiceActorName: "Kyoko", voiceDescription: "Tokyo accent"),
                        contentType: "audio/mpeg"),
                    VocabularyPronunciationAudio(
                        url: URL(string: "https://files.wanikani.com/9lzgz496ba6xeuj78icwqd9fzu4p")!,
                        metadata: VocabularyPronunciationAudioMetadata(gender: .female, sourceID: 21630, pronunciation: "いち", voiceActorID: 1, voiceActorName: "Kyoko", voiceDescription: "Tokyo accent"),
                        contentType: "audio/ogg"),
                    VocabularyPronunciationAudio(
                        url: URL(string: "https://files.wanikani.com/v6a1op509bhemf3fgsi6z07yw6o0")!,
                        metadata: VocabularyPronunciationAudioMetadata(gender: .male, sourceID: 2711, pronunciation: "いち", voiceActorID: 2, voiceActorName: "Kenichi", voiceDescription: "Tokyo accent"),
                        contentType: "audio/mpeg"),
                ],
                lessonPosition: 44,
                spacedRepetitionSystemID: 2))
        
        XCTAssertEqual(resource, expected)
    }
}
