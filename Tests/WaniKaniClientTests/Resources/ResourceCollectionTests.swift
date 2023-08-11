import XCTest
@testable import WaniKaniClient

final class ResourceCollectionTests: XCTestCase {
    func testDecode() throws {
        let testData = """
            {"object":"collection","url":"https://api.wanikani.com/v2/test_resource","pages":{"per_page":3,"next_url":"https://api.wanikani.com/v2/test_resource?page_after_id=4","previous_url":null},"total_count":10,"data_updated_at":"2019-06-23T19:22:33.018206Z","data":[{"id":1,"data":{"string":"test1"}},{"id":2,"data":{"string":"test2"}},{"id":3,"data":{"string":"test3"}}]}
            """.data(using: .utf8)!
        
        let decoder = ResourceDecoder()
        
        let resource = try decoder.decode(ResourceCollection<TestResource>.self, from: testData)
        
        let expected = ResourceCollection(
            url: URL(string: "https://api.wanikani.com/v2/test_resource")!,
            pages: ResourceCollectionPages(
                itemsPerPage: 3,
                nextURL: URL(string: "https://api.wanikani.com/v2/test_resource?page_after_id=4")!,
                previousURL: nil),
            totalCount: 10,
            dataUpdatedAt: makeUTCDate(year: 2019, month: 6, day: 23, hour: 19, minute: 22, second: 33, microsecond: 18206),
            data: [
                TestResource(id: 1, data: TestResourceData(string: "test1")),
                TestResource(id: 2, data: TestResourceData(string: "test2")),
                TestResource(id: 3, data: TestResourceData(string: "test3"))
            ]
        )
        
        XCTAssertEqual(resource, expected)
    }
}
