import Foundation
@testable import WaniKaniClient

struct UpdateTestRequest {
    let url: URL
    let updated: TestResource
}

extension UpdateTestRequest: ResourceUpdateRequest {
    typealias Resource = TestResource
    
    var httpMethod: String {
        return "POST"
    }
    
    var bodyContent: Codable {
        return updated.data
    }
}
