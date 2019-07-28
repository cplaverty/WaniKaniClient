import Foundation

public struct GetLevelProgressionRequest {
    public var id: Int
    
    public init(id: Int) {
        self.id = id
    }
}

extension GetLevelProgressionRequest: ResourceRequest {
    public typealias Resource = LevelProgressionResource
    
    public var requestURL: URL {
        return ResourceEndpoints.shared.levelProgressions.appendingPathComponent("\(id)")
    }
}
