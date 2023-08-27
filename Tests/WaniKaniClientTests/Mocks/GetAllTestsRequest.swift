import Foundation
@testable import WaniKaniClient

struct GetAllTestsRequest: ResourceCollectionGetRequest {
    typealias Resource = TestResource
    
    let url: URL
}
