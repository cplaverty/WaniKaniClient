import XCTest
@testable import WaniKaniClient

final class ResourceDecoderTests: XCTestCase {
    private let baseURL = URL(string: "https://api.wanikani.com/v2/")!
    
    func testDateNoFractionalSeconds() throws {
        let testData = #"{"date":"2018-01-04T08:31:35Z"}"#.data(using: .utf8)!
        
        let decoder = ResourceDecoder()
        
        let resource = try decoder.decode(TestResource.self, from: testData)
        
        let expected = TestResource(date: makeUTCDate(year: 2018, month: 1, day: 4, hour: 8, minute: 31, second: 35))
        
        XCTAssertEqual(resource, expected)
    }
    
    func testDateFractionalSeconds() throws {
        let testData = #"{"date":"2018-01-04T08:31:35.325623Z"}"#.data(using: .utf8)!
        
        let decoder = ResourceDecoder()
        
        let resource = try decoder.decode(TestResource.self, from: testData)
        
        let expected = TestResource(date: makeUTCDate(year: 2018, month: 1, day: 4, hour: 8, minute: 31, second: 35, microsecond: 325623))
        
        XCTAssertEqual(resource, expected)
    }
    
    func testInvalidDate() {
        let testData = #"{"date":"this is not a date"}"#.data(using: .utf8)!
        
        let decoder = ResourceDecoder()
        
        XCTAssertThrowsError(try decoder.decode(TestResource.self, from: testData))
    }
    
    static var allTests = [
        ("testDateNoFractionalSeconds", testDateNoFractionalSeconds),
        ("testDateFractionalSeconds", testDateFractionalSeconds),
        ("testInvalidDate", testInvalidDate),
    ]
}
