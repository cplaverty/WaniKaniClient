import XCTest
@testable import WaniKaniClient

final class WaniKaniClientTests: XCTestCase {
    private let apiKey = "00000000-0000-0000-0000-000000000000"
    
    override func tearDown() {
        MockURLProtocol.requestHandler.removeAll()
    }
    
    func testLoadRequest() async throws {
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
        Task {
            defer { expect.fulfill() }
            
            let resource = try await client.loadRequest(TestRequest(requestURL: requestURL))
            XCTAssertEqual(resource, expected)
        }
        
        await fulfillment(of: [expect], timeout: 3)
    }
    
    func testLoadCollectionRequestSinglePage() async throws {
        let requestURL = URL(string: "test://test-resources")!
        
        MockURLProtocol.requestHandler[requestURL] = { request in
            self.verifyHeadersForRequest(request)
            
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            
            let testData = #"{"object":"collection","url":"\#(requestURL.absoluteString)","pages":{"per_page":1,"next_url":null,"previous_url":null},"total_count":1,"data_updated_at":"2019-01-01T00:00:00.000000Z","data":[{"string":"content"}]}"#.data(using: .utf8)!
            return (response, testData)
        }
        
        let expected = [TestResource(string: "content")]
        
        let urlSession = makeURLSession()
        
        let expect = expectation(description: "request")
        let client = WaniKaniClient(apiKey: apiKey, urlSession: urlSession)
        Task {
            defer { expect.fulfill() }
            
            let resource = try await client.loadCollectionRequest(TestCollectionRequest(requestURL: requestURL))
            XCTAssertEqual(resource, expected)
        }
        
        await fulfillment(of: [expect], timeout: 3)
    }
    
    func testLoadCollectionRequestMultiplePage() async throws {
        let requestURL = URL(string: "test://test-resources")!
        let requestURLPage2 = URL(string: "test://test-resources?page=2")!
        
        MockURLProtocol.requestHandler[requestURL] = { request in
            self.verifyHeadersForRequest(request)
            
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            
            let testData = #"{"object":"collection","url":"\#(requestURL.absoluteString)","pages":{"per_page":1,"next_url":"\#(requestURLPage2)","previous_url":null},"total_count":2,"data_updated_at":"2019-01-01T00:00:00.000000Z","data":[{"string":"content"}]}"#.data(using: .utf8)!
            return (response, testData)
        }
        MockURLProtocol.requestHandler[requestURLPage2] = { request in
            self.verifyHeadersForRequest(request)
            
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            
            let testData = #"{"object":"collection","url":"\#(requestURLPage2.absoluteString)","pages":{"per_page":1,"next_url":null,"previous_url":"\#(requestURL)"},"total_count":2,"data_updated_at":"2019-01-01T00:00:00.000000Z","data":[{"string":"content2"}]}"#.data(using: .utf8)!
            return (response, testData)
        }
        
        let expected = [TestResource(string: "content"),
                        TestResource(string: "content2")]
        
        let urlSession = makeURLSession()
        
        let expect = expectation(description: "request")
        let client = WaniKaniClient(apiKey: apiKey, urlSession: urlSession)
        Task {
            defer { expect.fulfill() }
            
            let resource = try await client.loadCollectionRequest(TestCollectionRequest(requestURL: requestURL))
            XCTAssertEqual(resource, expected)
        }
        
        await fulfillment(of: [expect], timeout: 3)
    }
    
    func testLoadCollectionRequestMultiplePageErrorWithPartialResult() async throws {
        let requestURL = URL(string: "test://test-resources")!
        let requestURLPage2 = URL(string: "test://test-resources?page=2")!
        
        MockURLProtocol.requestHandler[requestURL] = { request in
            self.verifyHeadersForRequest(request)
            
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            
            let testData = #"{"object":"collection","url":"\#(requestURL.absoluteString)","pages":{"per_page":1,"next_url":"\#(requestURLPage2)","previous_url":null},"total_count":3,"data_updated_at":"2019-01-01T00:00:00.000000Z","data":[{"string":"content"}]}"#.data(using: .utf8)!
            return (response, testData)
        }
        MockURLProtocol.requestHandler[requestURLPage2] = { request in
            self.verifyHeadersForRequest(request)
            
            throw URLError(.notConnectedToInternet)
        }
        
        let urlSession = makeURLSession()
        
        let expect = expectation(description: "request")
        let client = WaniKaniClient(apiKey: apiKey, urlSession: urlSession)
        Task {
            defer { expect.fulfill() }
            
            do {
                let resource = try await client.loadCollectionRequest(TestCollectionRequest(requestURL: requestURL))
                XCTFail("Request was not expected to succeed but got resource: \(resource)")
            } catch let error as URLError {
                XCTAssertEqual(error.code, .notConnectedToInternet)
            } catch {
                XCTFail("Request failed with an unexpected error: \(error)")
            }
        }
        
        await fulfillment(of: [expect], timeout: 3)
    }
    
    func testUnauthorized() async throws {
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
        Task {
            defer { expect.fulfill() }
            
            do {
                let resource = try await client.loadRequest(TestRequest(requestURL: requestURL))
                XCTFail("Request was not expected to succeed but got resource: \(resource)")
            } catch WaniKaniClientError.invalidAPIKey {
                // Expected error
            } catch {
                XCTFail("Request failed with an unexpected error: \(error)")
            }
        }
        
        await fulfillment(of: [expect], timeout: 3)
    }
    
    func testNotFound() async throws {
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
        Task {
            defer { expect.fulfill() }
            
            do {
                let resource = try await client.loadRequest(TestRequest(requestURL: requestURL))
                XCTFail("Request was not expected to succeed but got resource: \(resource)")
            } catch WaniKaniClientError.apiError(let error, let code) {
                XCTAssertEqual(error, "Not found", "Unexpected error message")
                XCTAssertEqual(code, 404, "Unexpected error code")
            } catch {
                XCTFail("Request failed with an unexpected error: \(error)")
            }
        }
        
        await fulfillment(of: [expect], timeout: 3)
    }
    
    private func makeURLSession() -> URLSession {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        return URLSession(configuration: configuration)
    }
    
    private func verifyHeadersForRequest(_ request: URLRequest) {
        let authorizationHeaderValue = request.value(forHTTPHeaderField: "Authorization")
        XCTAssertEqual(authorizationHeaderValue, "Bearer \(apiKey)", "Unexpected Authorization header")
        
        let wanikaniRevisionHeaderValue = request.value(forHTTPHeaderField: "Wanikani-Revision")
        XCTAssertEqual(wanikaniRevisionHeaderValue, WaniKaniClient.apiRevision, "Unexpected Wanikani-Revision header")
    }
}
