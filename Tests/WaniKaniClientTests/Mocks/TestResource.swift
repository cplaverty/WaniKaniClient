import Foundation
@testable import WaniKaniClient

struct TestResource: Codable, Equatable {
    var id: Int
    var data: TestResourceData
}

extension TestResource: WaniKaniResource {
    var objectType: ResourceObjectType {
        return .unknown
    }
    
    var url: URL {
        return URL(string: "test://test-resources/\(id)")!
    }
    
    var dataUpdatedAt: Date {
        return makeUTCDate(year: 2000, month: 1, day: 1)
    }
}

struct TestResourceData: Codable, Equatable {
    var string: String? = nil
    var date: Date? = nil
}
