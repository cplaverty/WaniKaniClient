import Foundation
@testable import WaniKaniClient

struct TestRequest: ResourceRequest {
    typealias Resource = TestResource
    
    let requestURL: URL
}
