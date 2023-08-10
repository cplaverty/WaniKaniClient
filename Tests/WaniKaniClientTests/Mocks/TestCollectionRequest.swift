import Foundation
@testable import WaniKaniClient

struct TestCollectionRequest: ResourceCollectionRequest {
    typealias Resource = TestResource
    
    let requestURL: URL
}
