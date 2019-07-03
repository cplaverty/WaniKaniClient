import Foundation
@testable import WaniKaniClient

final class TestCollectionRequest: ResourceCollectionRequest {
    typealias Resource = TestResource
    
    let requestURL: URL
    
    init(requestURL: URL) {
        self.requestURL = requestURL
    }
}
