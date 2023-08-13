import Foundation
@testable import WaniKaniClient

struct TestCollectionRequest: ResourceCollectionGetRequest {
    typealias Resource = TestResource
    
    let requestURL: URL
}
