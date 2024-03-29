import XCTest
@testable import WaniKaniClient

final class WaniKaniClientTests: XCTestCase {
    private let apiKey = "00000000-0000-0000-0000-000000000000"
    
    override func tearDown() {
        MockURLProtocol.requestHandler.removeAll()
    }
    
    func testGetResource() async throws {
        let requestURL = URL(string: "test://test-resources/1")!
        
        MockURLProtocol.requestHandler[requestURL] = { request in
            self.verifyHeadersForGetRequest(request)
            
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            
            let testData = #"{"id":1,"data":{"string":"content"}}"#.data(using: .utf8)!
            return (response, testData)
        }
        
        let expected = TestResource(id: 1, data: TestResourceData(string: "content"))
        
        let urlSession = makeURLSession()
        
        let expect = expectation(description: "request")
        let client = WaniKaniClient(apiKey: apiKey, urlSession: urlSession)
        Task {
            let resource = try await client.resource(for: GetTestRequest(url: requestURL))
            XCTAssertEqual(resource, expected)
            
            expect.fulfill()
        }
        
        await fulfillment(of: [expect], timeout: 3)
    }
    
    func testGetResourceCollectionSinglePage() async throws {
        let requestURL = URL(string: "test://test-resources")!
        
        MockURLProtocol.requestHandler[requestURL] = { request in
            self.verifyHeadersForGetRequest(request)
            
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            
            let testData = #"{"object":"collection","url":"\#(requestURL)","pages":{"per_page":1,"next_url":null,"previous_url":null},"total_count":1,"data_updated_at":"2019-01-01T00:00:00.000000Z","data":[{"id":1,"data":{"string":"content"}}]}"#.data(using: .utf8)!
            return (response, testData)
        }
        
        let expected = [
            ResourceCollection(
                url: requestURL,
                pages: ResourceCollectionPages(itemsPerPage: 1),
                totalCount: 1,
                dataUpdatedAt: Date.makeUTC(year: 2019, month: 1, day: 1),
                data: [TestResource(id: 1, data: TestResourceData(string: "content"))])
        ]
        
        let urlSession = makeURLSession()
        
        let expect = expectation(description: "request")
        let client = WaniKaniClient(apiKey: apiKey, urlSession: urlSession)
        Task {
            let resources = try await client.resources(for: GetAllTestsRequest(url: requestURL))
                .reduce(into: [], { $0.append($1) })
            XCTAssertEqual(resources, expected)
            
            expect.fulfill()
        }
        
        await fulfillment(of: [expect], timeout: 3)
    }
    
    func testGetResourceCollectionMultiplePages() async throws {
        let requestURL = URL(string: "test://test-resources")!
        let requestURLPage2 = URL(string: "test://test-resources?page=2")!
        
        MockURLProtocol.requestHandler[requestURL] = { request in
            self.verifyHeadersForGetRequest(request)
            
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            
            let testData = #"{"object":"collection","url":"\#(requestURL)","pages":{"per_page":1,"next_url":"\#(requestURLPage2)","previous_url":null},"total_count":2,"data_updated_at":"2019-01-01T00:00:00.000000Z","data":[{"id":1,"data":{"string":"content"}}]}"#.data(using: .utf8)!
            return (response, testData)
        }
        MockURLProtocol.requestHandler[requestURLPage2] = { request in
            self.verifyHeadersForGetRequest(request)
            
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            
            let testData = #"{"object":"collection","url":"\#(requestURLPage2)","pages":{"per_page":1,"next_url":null,"previous_url":"\#(requestURL)"},"total_count":2,"data_updated_at":"2019-01-01T00:00:00.000000Z","data":[{"id":2,"data":{"string":"content2"}}]}"#.data(using: .utf8)!
            return (response, testData)
        }
        
        let expected = [
            ResourceCollection(
                url: requestURL,
                pages: ResourceCollectionPages(itemsPerPage: 1, nextURL: requestURLPage2),
                totalCount: 2,
                dataUpdatedAt: Date.makeUTC(year: 2019, month: 1, day: 1),
                data: [TestResource(id: 1, data: TestResourceData(string: "content"))]),
            ResourceCollection(
                url: requestURLPage2,
                pages: ResourceCollectionPages(itemsPerPage: 1, previousURL: requestURL),
                totalCount: 2,
                dataUpdatedAt: Date.makeUTC(year: 2019, month: 1, day: 1),
                data: [TestResource(id: 2, data: TestResourceData(string: "content2"))])
        ]
        
        let urlSession = makeURLSession()
        
        let expect = expectation(description: "request")
        let client = WaniKaniClient(apiKey: apiKey, urlSession: urlSession)
        Task {
            let resources = try await client.resources(for: GetAllTestsRequest(url: requestURL))
                .reduce(into: [], { $0.append($1) })
            XCTAssertEqual(resources, expected)
            
            expect.fulfill()
        }
        
        await fulfillment(of: [expect], timeout: 3)
    }
    
    func testGetResourceCollectionMultiplePagesThrowsErrorWithPartialResult() async throws {
        let requestURL = URL(string: "test://test-resources")!
        let requestURLPage2 = URL(string: "test://test-resources?page=2")!
        
        MockURLProtocol.requestHandler[requestURL] = { request in
            self.verifyHeadersForGetRequest(request)
            
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            
            let testData = #"{"object":"collection","url":"\#(requestURL)","pages":{"per_page":1,"next_url":"\#(requestURLPage2)","previous_url":null},"total_count":3,"data_updated_at":"2019-01-01T00:00:00.000000Z","data":[{"id":1,"data":{"string":"content"}}]}"#.data(using: .utf8)!
            return (response, testData)
        }
        MockURLProtocol.requestHandler[requestURLPage2] = { request in
            self.verifyHeadersForGetRequest(request)
            
            throw URLError(.notConnectedToInternet)
        }
        
        let expected = ResourceCollection(
            url: requestURL,
            pages: ResourceCollectionPages(itemsPerPage: 1, nextURL: requestURLPage2),
            totalCount: 3,
            dataUpdatedAt: Date.makeUTC(year: 2019, month: 1, day: 1),
            data: [TestResource(id: 1, data: TestResourceData(string: "content"))])
        
        let urlSession = makeURLSession()
        
        let expect = expectation(description: "request")
        let client = WaniKaniClient(apiKey: apiKey, urlSession: urlSession)
        Task {
            var iter = client.resources(for: GetAllTestsRequest(url: requestURL)).makeAsyncIterator()
            
            let first = try await iter.next()
            XCTAssertEqual(first, expected)
            
            do {
                let second = try await iter.next()
                XCTFail("Request was not expected to succeed but got resource: \(String(describing: second))")
            } catch let error as URLError {
                XCTAssertEqual(error.code, .notConnectedToInternet)
            } catch {
                XCTFail("Request failed with an unexpected error: \(error)")
            }
            
            expect.fulfill()
        }
        
        await fulfillment(of: [expect], timeout: 3)
    }
    
    func testUpdateResource() async throws {
        let requestURL = URL(string: "test://test-resources/1")!
        
        let expectedHTTPMethod = "POST"
        let expectedHTTPBody = #"{"string":"new content"}"#
        
        MockURLProtocol.requestHandler[requestURL] = { request in
            self.verifyHeadersForUpdateRequest(request)
            XCTAssertEqual(request.httpMethod, expectedHTTPMethod)
            if let httpBodyData = request.httpBody {
                let httpBody = String(data: httpBodyData, encoding: .utf8)
                XCTAssertEqual(httpBody, expectedHTTPBody)
            } else if let httpBodyStream = request.httpBodyStream {
                let httpBodyData = try Data(reading: httpBodyStream)
                let httpBody = String(data: httpBodyData, encoding: .utf8)
                XCTAssertEqual(httpBody, expectedHTTPBody)
            } else {
                XCTFail("Empty request body")
            }
            
            let response = HTTPURLResponse(url: request.url!, statusCode: 201, httpVersion: nil, headerFields: nil)!
            
            let testData = #"{"id":1,"data":\#(expectedHTTPBody)}"#.data(using: .utf8)!
            return (response, testData)
        }
        
        let expected = TestResource(id: 1, data: TestResourceData(string: "new content"))
        
        let urlSession = makeURLSession()
        
        let expect = expectation(description: "request")
        let client = WaniKaniClient(apiKey: apiKey, urlSession: urlSession)
        Task {
            let resource = try await client.updateResource(for: UpdateTestRequest(url: requestURL, updated: expected))
            XCTAssertEqual(resource, expected)
            
            expect.fulfill()
        }
        
        await fulfillment(of: [expect], timeout: 3)
    }
    
    func testUnauthorized() async throws {
        let requestURL = URL(string: "test://test-resources/1")!
        
        MockURLProtocol.requestHandler[requestURL] = { request in
            self.verifyHeadersForGetRequest(request)
            
            let response = HTTPURLResponse(url: request.url!, statusCode: 401, httpVersion: nil, headerFields: nil)!
            
            let testData = #"{"error":"Unauthorized. Nice try.","code":401}"#.data(using: .utf8)!
            return (response, testData)
        }
        
        let urlSession = makeURLSession()
        
        let expect = expectation(description: "request")
        let client = WaniKaniClient(apiKey: apiKey, urlSession: urlSession)
        Task {
            do {
                let resource = try await client.resource(for: GetTestRequest(url: requestURL))
                XCTFail("Request was not expected to succeed but got resource: \(resource)")
            } catch WaniKaniClientError.invalidAPIKey {
                // Expected error
            } catch {
                XCTFail("Request failed with an unexpected error: \(error)")
            }
            
            expect.fulfill()
        }
        
        await fulfillment(of: [expect], timeout: 3)
    }
    
    func testNotFound() async throws {
        let requestURL = URL(string: "test://test-resources/1")!
        
        MockURLProtocol.requestHandler[requestURL] = { request in
            self.verifyHeadersForGetRequest(request)
            
            let response = HTTPURLResponse(url: request.url!, statusCode: 404, httpVersion: nil, headerFields: nil)!
            
            let testData = #"{"error":"Not found","code":404}"#.data(using: .utf8)!
            return (response, testData)
        }
        
        let urlSession = makeURLSession()
        
        let expect = expectation(description: "request")
        let client = WaniKaniClient(apiKey: apiKey, urlSession: urlSession)
        Task {
            do {
                let resource = try await client.resource(for: GetTestRequest(url: requestURL))
                XCTFail("Request was not expected to succeed but got resource: \(resource)")
            } catch WaniKaniClientError.apiError(let error, let code) {
                XCTAssertEqual(error, "Not found", "Unexpected error message")
                XCTAssertEqual(code, 404, "Unexpected error code")
            } catch {
                XCTFail("Request failed with an unexpected error: \(error)")
            }
            
            expect.fulfill()
        }
        
        await fulfillment(of: [expect], timeout: 3)
    }
    
    private func makeURLSession() -> URLSession {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        return URLSession(configuration: configuration)
    }
    
    private func verifyHeadersForGetRequest(_ request: URLRequest) {
        let authorizationHeaderValue = request.value(forHTTPHeaderField: "Authorization")
        XCTAssertEqual(authorizationHeaderValue, "Bearer \(apiKey)", "Unexpected Authorization header")
        
        let wanikaniRevisionHeaderValue = request.value(forHTTPHeaderField: "Wanikani-Revision")
        XCTAssertEqual(wanikaniRevisionHeaderValue, WaniKaniClient.apiRevision, "Unexpected Wanikani-Revision header")
        
        let wanikaniAcceptHeaderValue = request.value(forHTTPHeaderField: "Accept")
        XCTAssertEqual(wanikaniAcceptHeaderValue, "application/json; charset=utf-8", "Unexpected Accept header")
    }
    
    private func verifyHeadersForUpdateRequest(_ request: URLRequest) {
        let authorizationHeaderValue = request.value(forHTTPHeaderField: "Authorization")
        XCTAssertEqual(authorizationHeaderValue, "Bearer \(apiKey)", "Unexpected Authorization header")
        
        let wanikaniRevisionHeaderValue = request.value(forHTTPHeaderField: "Wanikani-Revision")
        XCTAssertEqual(wanikaniRevisionHeaderValue, WaniKaniClient.apiRevision, "Unexpected Wanikani-Revision header")
        
        let wanikaniAcceptHeaderValue = request.value(forHTTPHeaderField: "Accept")
        XCTAssertEqual(wanikaniAcceptHeaderValue, "application/json; charset=utf-8", "Unexpected Accept header")
        
        let wanikaniContentTypeHeaderValue = request.value(forHTTPHeaderField: "Content-Type")
        XCTAssertEqual(wanikaniContentTypeHeaderValue, "application/json; charset=utf-8", "Unexpected Content-Type header")
    }
}
