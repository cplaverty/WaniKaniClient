import Foundation
@testable import WaniKaniClient

final class TestRequest: ResourceRequest {
    typealias Resource = TestResource
    
    let requestURL: URL
    
    init(requestURL: URL) {
        self.requestURL = requestURL
    }
}
