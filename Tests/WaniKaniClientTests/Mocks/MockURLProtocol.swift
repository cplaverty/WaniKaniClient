import Foundation
import XCTest
@testable import WaniKaniClient

final class MockURLProtocol: URLProtocol {
    typealias RequestHandler = ((URLRequest) throws -> (HTTPURLResponse, Data))
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    static var requestHandler = [URL: RequestHandler]()
    
    override func startLoading() {
        let url = request.url!
        
        do {
            let response: HTTPURLResponse
            let data: Data
            
            if let handler = MockURLProtocol.requestHandler[url] {
                (response, data) = try handler(request)
            } else {
                response = HTTPURLResponse(url: url, statusCode: 404, httpVersion: nil, headerFields: nil)!
                let error = WaniKaniAPIError(error: "No handler set for URL: \(url)", code: 404)
                data = try JSONEncoder().encode(error)
            }
            
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            client?.urlProtocol(self, didLoad: data)
            client?.urlProtocolDidFinishLoading(self)
        } catch {
            client?.urlProtocol(self, didFailWithError: error)
        }
    }
    
    override func stopLoading() {
    }
}
