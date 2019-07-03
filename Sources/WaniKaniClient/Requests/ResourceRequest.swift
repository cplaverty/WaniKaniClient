import Foundation

public protocol ResourceRequest {
    associatedtype Resource: Codable
    typealias ResponseType = Resource
    
    var requestURL: URL { get }
    func decodeResource(from: Data) throws -> ResponseType
}

extension ResourceRequest {
    public func decodeResource(from data: Data) throws -> ResponseType {
        return try ResourceDecoder.shared.decode(ResponseType.self, from: data)
    }
}
