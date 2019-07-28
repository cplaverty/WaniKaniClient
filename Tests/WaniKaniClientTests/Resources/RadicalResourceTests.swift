import XCTest
@testable import WaniKaniClient

final class RadicalResourceTests: XCTestCase {
    private let testData = #"""
            {"id":1,"object":"radical","url":"https://api.wanikani.com/v2/subjects/1","data_updated_at":"2019-02-07T00:28:35.020617Z","data":{"created_at":"2012-02-27T18:08:16.000000Z","level":1,"slug":"ground","hidden_at":null,"document_url":"https://www.wanikani.com/radicals/ground","characters":"一","character_images":[{"url":"https://cdn.wanikani.com/images/legacy/1054-subject-1-normal-weight-black-original.png?1520987606","metadata":{"color":"#000000","dimensions":"1024x1024","style_name":"original"},"content_type":"image/png"},{"url":"https://cdn.wanikani.com/images/legacy/1054-subject-1-normal-weight-black-1024px.png?1520987606","metadata":{"color":"#000000","dimensions":"1024x1024","style_name":"1024px"},"content_type":"image/png"},{"url":"https://cdn.wanikani.com/images/legacy/1054-subject-1-normal-weight-black-512px.png?1520987606","metadata":{"color":"#000000","dimensions":"512x512","style_name":"512px"},"content_type":"image/png"},{"url":"https://cdn.wanikani.com/images/legacy/1054-subject-1-normal-weight-black-256px.png?1520987606","metadata":{"color":"#000000","dimensions":"256x256","style_name":"256px"},"content_type":"image/png"},{"url":"https://cdn.wanikani.com/images/legacy/1054-subject-1-normal-weight-black-128px.png?1520987606","metadata":{"color":"#000000","dimensions":"128x128","style_name":"128px"},"content_type":"image/png"},{"url":"https://cdn.wanikani.com/images/legacy/1054-subject-1-normal-weight-black-64px.png?1520987606","metadata":{"color":"#000000","dimensions":"64x64","style_name":"64px"},"content_type":"image/png"},{"url":"https://cdn.wanikani.com/images/legacy/1054-subject-1-normal-weight-black-32px.png?1520987606","metadata":{"color":"#000000","dimensions":"32x32","style_name":"32px"},"content_type":"image/png"},{"url":"https://cdn.wanikani.com/images/legacy/576-subject-1-without-css-original.svg?1520987227","metadata":{"inline_styles":false},"content_type":"image/svg+xml"},{"url":"https://cdn.wanikani.com/images/legacy/98-subject-1-with-css-original.svg?1520987072","metadata":{"inline_styles":true},"content_type":"image/svg+xml"}],"meanings":[{"meaning":"Ground","primary":true,"accepted_answer":true}],"auxiliary_meanings":[],"amalgamation_subject_ids":[440,449,450,451,488,531,533,568,590,609,633,635,709,710,724,783,808,885,913,932,965,971,1000,1020,1085,1113,1119,1126,1137,1178,1198,1241,1249,1326,1340,1367,1372,1376,1379,1428,1431,1463,1491,1506,1521,1547,1559,1591,1655,1769,1851,1852,1855,1868,1869,1888,1970,2091,2104,2128,2138,2148,2171,2172,2182,2212,2277,2334,2375,2419,2437],"meaning_mnemonic":"This radical consists of a single, horizontal stroke. What's the biggest, single, horizontal stroke? That's the \u003cradical\u003eground\u003c/radical\u003e. Look at the ground, look at this radical, now look at the ground again. Kind of the same, right?","lesson_position":0}}
            """#.data(using: .utf8)!
    
    func testDecode() throws {
        let decoder = ResourceDecoder()
        
        let resource = try decoder.decode(SubjectResource.self, from: testData)
        
        let expected = SubjectResource(
            id: 1,
            url: URL(string: "https://api.wanikani.com/v2/subjects/1")!,
            dataUpdatedAt: makeUTCDate(year: 2019, month: 2, day: 7, hour: 0, minute: 28, second: 35, microsecond: 20617),
            data: RadicalResource(
                createdAt: makeUTCDate(year: 2012, month: 2, day: 27, hour: 18, minute: 8, second: 16),
                level: 1,
                slug: "ground",
                hiddenAt: nil,
                documentURL: URL(string: "https://www.wanikani.com/radicals/ground")!,
                characters: "一",
                characterImages: [
                    RadicalCharacterImage(
                        url: URL(string: "https://cdn.wanikani.com/images/legacy/1054-subject-1-normal-weight-black-original.png?1520987606")!,
                        metadata: RadicalCharacterImageMetadata(color: "#000000", dimensions: "1024x1024", styleName: "original", inlineStyles: nil),
                        contentType: "image/png"),
                    RadicalCharacterImage(
                        url: URL(string: "https://cdn.wanikani.com/images/legacy/1054-subject-1-normal-weight-black-1024px.png?1520987606")!,
                        metadata: RadicalCharacterImageMetadata(color: "#000000", dimensions: "1024x1024", styleName: "1024px", inlineStyles: nil),
                        contentType: "image/png"),
                    RadicalCharacterImage(
                        url: URL(string: "https://cdn.wanikani.com/images/legacy/1054-subject-1-normal-weight-black-512px.png?1520987606")!,
                        metadata: RadicalCharacterImageMetadata(color: "#000000", dimensions: "512x512", styleName: "512px", inlineStyles: nil),
                        contentType: "image/png"),
                    RadicalCharacterImage(
                        url: URL(string: "https://cdn.wanikani.com/images/legacy/1054-subject-1-normal-weight-black-256px.png?1520987606")!,
                        metadata: RadicalCharacterImageMetadata(color: "#000000", dimensions: "256x256", styleName: "256px", inlineStyles: nil),
                        contentType: "image/png"),
                    RadicalCharacterImage(
                        url: URL(string: "https://cdn.wanikani.com/images/legacy/1054-subject-1-normal-weight-black-128px.png?1520987606")!,
                        metadata: RadicalCharacterImageMetadata(color: "#000000", dimensions: "128x128", styleName: "128px", inlineStyles: nil),
                        contentType: "image/png"),
                    RadicalCharacterImage(
                        url: URL(string: "https://cdn.wanikani.com/images/legacy/1054-subject-1-normal-weight-black-64px.png?1520987606")!,
                        metadata: RadicalCharacterImageMetadata(color: "#000000", dimensions: "64x64", styleName: "64px", inlineStyles: nil),
                        contentType: "image/png"),
                    RadicalCharacterImage(
                        url: URL(string: "https://cdn.wanikani.com/images/legacy/1054-subject-1-normal-weight-black-32px.png?1520987606")!,
                        metadata: RadicalCharacterImageMetadata(color: "#000000", dimensions: "32x32", styleName: "32px", inlineStyles: nil),
                        contentType: "image/png"),
                    RadicalCharacterImage(
                        url: URL(string: "https://cdn.wanikani.com/images/legacy/576-subject-1-without-css-original.svg?1520987227")!,
                        metadata: RadicalCharacterImageMetadata(color: nil, dimensions: nil, styleName: nil, inlineStyles: false),
                        contentType: "image/svg+xml"),
                    RadicalCharacterImage(
                        url: URL(string: "https://cdn.wanikani.com/images/legacy/98-subject-1-with-css-original.svg?1520987072")!,
                        metadata: RadicalCharacterImageMetadata(color: nil, dimensions: nil, styleName: nil, inlineStyles: true),
                        contentType: "image/svg+xml")
                ],
                meanings: [Meaning(meaning: "Ground", isPrimary: true, isAcceptedAnswer: true)],
                auxiliaryMeanings: [],
                amalgamationSubjectIDs: [440, 449, 450, 451, 488, 531, 533, 568, 590, 609, 633, 635, 709, 710, 724, 783, 808, 885, 913, 932, 965, 971, 1000, 1020, 1085, 1113, 1119, 1126, 1137, 1178, 1198, 1241, 1249, 1326, 1340, 1367, 1372, 1376, 1379, 1428, 1431, 1463, 1491, 1506, 1521, 1547, 1559, 1591, 1655, 1769, 1851, 1852, 1855, 1868, 1869, 1888, 1970, 2091, 2104, 2128, 2138, 2148, 2171, 2172, 2182, 2212, 2277, 2334, 2375, 2419, 2437],
                meaningMnemonic: "This radical consists of a single, horizontal stroke. What's the biggest, single, horizontal stroke? That's the <radical>ground</radical>. Look at the ground, look at this radical, now look at the ground again. Kind of the same, right?",
                lessonPosition: 0))
        
        XCTAssertEqual(resource, expected)
    }
    
    static var allTests = [
        ("testDecode", testDecode),
    ]
}
