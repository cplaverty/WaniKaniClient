import Foundation
@testable import WaniKaniClient

struct TestRequest: ResourceGetRequest {
    typealias Resource = TestResource
    
    let requestURL: URL
}
