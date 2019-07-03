import Foundation

public protocol ResourceCollectionRequest {
    associatedtype Resource: Codable
    typealias ResponseType = ResourceCollection<Resource>
    
    var requestURL: URL { get }
    func decodeResource(from: Data) throws -> ResponseType
}

extension ResourceCollectionRequest {
    public func decodeResource(from data: Data) throws -> ResponseType {
        return try ResourceDecoder.shared.decode(ResponseType.self, from: data)
    }
}
