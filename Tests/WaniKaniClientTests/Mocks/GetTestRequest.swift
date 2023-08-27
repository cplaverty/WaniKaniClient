import Foundation
@testable import WaniKaniClient

struct GetTestRequest: ResourceGetRequest {
    typealias Resource = TestResource
    
    let url: URL
}
