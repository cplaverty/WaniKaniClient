import XCTest
@testable import WaniKaniClient

final class ResourceCollectionTests: XCTestCase {
    func testDecode() throws {
        let testData = """
            {"object":"collection","url":"https://api.wanikani.com/v2/test_resource","pages":{"per_page":3,"next_url":"https://api.wanikani.com/v2/test_resource?page_after_id=4","previous_url":null},"total_count":10,"data_updated_at":"2019-06-23T19:22:33.018206Z","data":[{"string":"test1"},{"string":"test2"},{"string":"test3"}]}
            """.data(using: .utf8)!
        
        let decoder = ResourceDecoder()
        
        let resource = try decoder.decode(ResourceCollection<TestResource>.self, from: testData)
        
        let expected = ResourceCollection(
            object: "collection",
            url: URL(string: "https://api.wanikani.com/v2/test_resource")!,
            pages: ResourceCollectionPages(
                previousURL: nil,
                nextURL: URL(string: "https://api.wanikani.com/v2/test_resource?page_after_id=4")!,
                itemsPerPage: 3),
            totalCount: 10,
            dataUpdatedAt: makeUTCDate(year: 2019, month: 6, day: 23, hour: 19, minute: 22, second: 33, microsecond: 18206),
            data: [
                TestResource(string: "test1"),
                TestResource(string: "test2"),
                TestResource(string: "test3")
            ]
        )
        
        XCTAssertEqual(resource, expected)
        XCTAssertEqual(4, resource.estimatedPageCount)
    }
    
    func testEstimatedPageCountExactMultiple() throws {
        let resource = ResourceCollection(
            object: "collection",
            url: URL(string: "https://api.wanikani.com/v2/test_resource")!,
            pages: ResourceCollectionPages(
                previousURL: nil,
                nextURL: URL(string: "https://api.wanikani.com/v2/test_resource?page_after_id=4")!,
                itemsPerPage: 3),
            totalCount: 9,
            dataUpdatedAt: Date(),
            data: [
                TestResource(string: "test1"),
                TestResource(string: "test2"),
                TestResource(string: "test3")
            ]
        )
        
        XCTAssertEqual(3, resource.estimatedPageCount)
    }
    
    func testEstimatedPageCountSinglePage() throws {
        let resource = ResourceCollection(
            object: "collection",
            url: URL(string: "https://api.wanikani.com/v2/test_resource")!,
            pages: ResourceCollectionPages(
                previousURL: nil,
                nextURL: nil,
                itemsPerPage: 30),
            totalCount: 3,
            dataUpdatedAt: Date(),
            data: [
                TestResource(string: "test1"),
                TestResource(string: "test2"),
                TestResource(string: "test3")
            ]
        )
        
        XCTAssertEqual(1, resource.estimatedPageCount)
    }
    
    static var allTests = [
        ("testDecode", testDecode),
        ("testEstimatedPageCountExactMultiple", testEstimatedPageCountExactMultiple),
        ("testEstimatedPageCountSinglePage", testEstimatedPageCountSinglePage),
    ]
}
