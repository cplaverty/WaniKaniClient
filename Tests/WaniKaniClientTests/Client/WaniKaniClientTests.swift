import XCTest
@testable import WaniKaniClient

final class WaniKaniClientTests: XCTestCase {
    private let apiKey = "00000000-0000-0000-0000-000000000000"
    
    override func tearDown() {
        MockURLProtocol.requestHandler.removeAll()
    }
    
    func testLoadRequest() throws {
        let requestURL = URL(string: "test://test-resources/1")!
        
        MockURLProtocol.requestHandler[requestURL] = { request in
            self.verifyHeadersForRequest(request)
            
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            
            let testData = #"{"string":"content"}"#.data(using: .utf8)!
            return (response, testData)
        }
        
        let expected = TestResource(string: "content")
        
        let urlSession = makeURLSession()
        
        let expect = expectation(description: "request")
        let client = WaniKaniClient(apiKey: apiKey, urlSession: urlSession)
        let progress = client.loadRequest(TestRequest(requestURL: requestURL)) { result in
            defer { expect.fulfill() }
            
            switch result {
            case let .failure(error):
                XCTFail("Request was not successful: \(error)")
            case let .success(resource):
                XCTAssertEqual(resource, expected)
            }
        }
        
        wait(for: [expect], timeout: 3)
        XCTAssertEqual(progress.fractionCompleted, 1.0, accuracy: 0.1)
    }
    
    func testLoadCollectionRequestSinglePage() throws {
        let requestURL = URL(string: "test://test-resources")!
        
        MockURLProtocol.requestHandler[requestURL] = { request in
            self.verifyHeadersForRequest(request)
            
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            
            let testData = #"{"object":"collection","url":"\#(requestURL.absoluteString)","pages":{"per_page":1,"next_url":null,"previous_url":null},"total_count":1,"data_updated_at":null,"data":[{"string":"content"}]}"#.data(using: .utf8)!
            return (response, testData)
        }
        
        let expected = ResourceCollection(object: "collection",
                                          url: requestURL,
                                          pages: ResourceCollectionPages(previousURL: nil, nextURL: nil, itemsPerPage: 1),
                                          totalCount: 1,
                                          dataUpdatedAt: nil,
                                          data: [TestResource(string: "content")])
        
        let urlSession = makeURLSession()
        
        let expect = expectation(description: "request")
        let client = WaniKaniClient(apiKey: apiKey, urlSession: urlSession)
        let progress = client.loadCollectionRequest(TestCollectionRequest(requestURL: requestURL)) { result in
            defer { expect.fulfill() }
            
            switch result {
            case let .failure(error):
                XCTFail("Request was not successful: \(error)")
            case let .success(resource):
                XCTAssertEqual(resource, expected)
            }
            
            return true
        }
        
        wait(for: [expect], timeout: 3)
        XCTAssertEqual(progress.fractionCompleted, 1.0, accuracy: 0.1)
    }
    
    func testLoadCollectionRequestMultiplePage() throws {
        let requestURL = URL(string: "test://test-resources")!
        let requestURLPage2 = URL(string: "test://test-resources?page=2")!
        
        MockURLProtocol.requestHandler[requestURL] = { request in
            self.verifyHeadersForRequest(request)
            
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            
            let testData = #"{"object":"collection","url":"\#(requestURL.absoluteString)","pages":{"per_page":1,"next_url":"\#(requestURLPage2)","previous_url":null},"total_count":2,"data_updated_at":null,"data":[{"string":"content"}]}"#.data(using: .utf8)!
            return (response, testData)
        }
        MockURLProtocol.requestHandler[requestURLPage2] = { request in
            self.verifyHeadersForRequest(request)
            
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            
            let testData = #"{"object":"collection","url":"\#(requestURLPage2.absoluteString)","pages":{"per_page":1,"next_url":null,"previous_url":"\#(requestURL)"},"total_count":2,"data_updated_at":null,"data":[{"string":"content2"}]}"#.data(using: .utf8)!
            return (response, testData)
        }
        
        let expecteds = [ResourceCollection(object: "collection",
                                            url: requestURL,
                                            pages: ResourceCollectionPages(previousURL: nil, nextURL: requestURLPage2, itemsPerPage: 1),
                                            totalCount: 2,
                                            dataUpdatedAt: nil,
                                            data: [TestResource(string: "content")]),
                         ResourceCollection(object: "collection",
                                            url: requestURLPage2,
                                            pages: ResourceCollectionPages(previousURL: requestURL, nextURL: nil, itemsPerPage: 1),
                                            totalCount: 2,
                                            dataUpdatedAt: nil,
                                            data: [TestResource(string: "content2")])]
        
        let urlSession = makeURLSession()
        
        var expects = [expectation(description: "request page 1"),
                       expectation(description: "request page 2")]
        let client = WaniKaniClient(apiKey: apiKey, urlSession: urlSession)
        var pageIndex = 0
        let progress = client.loadCollectionRequest(TestCollectionRequest(requestURL: requestURL)) { result in
            let currentPageIndex = pageIndex
            pageIndex += 1
            
            defer { expects[currentPageIndex].fulfill() }
            
            switch result {
            case let .failure(error):
                XCTFail("Request was not successful: \(error)")
            case let .success(resource):
                XCTAssertEqual(resource, expecteds[currentPageIndex])
            }
            
            return true
        }
        
        wait(for: expects, timeout: 3)
        XCTAssertEqual(progress.fractionCompleted, 1.0, accuracy: 0.1)
        XCTAssertEqual(pageIndex, 2)
    }
    
    func testUnauthorized() throws {
        let requestURL = URL(string: "test://test-resources/1")!
        
        MockURLProtocol.requestHandler[requestURL] = { request in
            self.verifyHeadersForRequest(request)
            
            let response = HTTPURLResponse(url: request.url!, statusCode: 401, httpVersion: nil, headerFields: nil)!
            
            let testData = #"{"error":"Unauthorized. Nice try.","code":401}"#.data(using: .utf8)!
            return (response, testData)
        }
        
        let urlSession = makeURLSession()
        
        let expect = expectation(description: "request")
        let client = WaniKaniClient(apiKey: apiKey, urlSession: urlSession)
        let _ = client.loadRequest(TestRequest(requestURL: requestURL)) { result in
            defer { expect.fulfill() }
            
            switch result {
            case .failure(WaniKaniClientError.invalidAPIKey):
                break
            case let .failure(error):
                XCTFail("Request failed with an unexpected error: \(error)")
            case let .success(resource):
                XCTFail("Request was not expected to succeed: \(resource)")
            }
        }
        
        wait(for: [expect], timeout: 3)
    }
    
    func testNotFound() throws {
        let requestURL = URL(string: "test://test-resources/1")!
        
        MockURLProtocol.requestHandler[requestURL] = { request in
            self.verifyHeadersForRequest(request)
            
            let response = HTTPURLResponse(url: request.url!, statusCode: 404, httpVersion: nil, headerFields: nil)!
            
            let testData = #"{"error":"Not found","code":404}"#.data(using: .utf8)!
            return (response, testData)
        }
        
        let urlSession = makeURLSession()
        
        let expect = expectation(description: "request")
        let client = WaniKaniClient(apiKey: apiKey, urlSession: urlSession)
        let _ = client.loadRequest(TestRequest(requestURL: requestURL)) { result in
            defer { expect.fulfill() }
            
            switch result {
            case let .failure(WaniKaniClientError.apiError(error: error, code: code)):
                XCTAssertEqual(error, "Not found", "Unexpected error message")
                XCTAssertEqual(code, 404, "Unexpected error code")
            case let .failure(error):
                XCTFail("Request failed with an unexpected error: \(error)")
            case let .success(resource):
                XCTFail("Request was not expected to succeed: \(resource)")
            }
        }
        
        wait(for: [expect], timeout: 3)
    }
    
    private func makeURLSession() -> URLSession {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        return URLSession(configuration: configuration)
    }
    
    private func verifyHeadersForRequest(_ request: URLRequest) {
        let authorizationHeaderValue = request.value(forHTTPHeaderField: "Authorization")
        XCTAssertEqual(authorizationHeaderValue, "Bearer \(self.apiKey)", "Unexpected Authorization header")
        
        let wanikaniRevisionHeaderValue = request.value(forHTTPHeaderField: "Wanikani-Revision")
        XCTAssertEqual(wanikaniRevisionHeaderValue, WaniKaniClient.apiRevision, "Unexpected Wanikani-Revision header")
    }
    
    static var allTests = [
        ("testLoadRequest", testLoadRequest),
        ("testLoadCollectionRequestSinglePage", testLoadCollectionRequestSinglePage),
        ("testLoadCollectionRequestMultiplePage", testLoadCollectionRequestMultiplePage),
        ("testUnauthorized", testUnauthorized),
        ("testNotFound", testNotFound),
    ]
}
