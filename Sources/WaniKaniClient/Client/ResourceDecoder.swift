import Foundation

open class ResourceDecoder {
    public static var shared = ResourceDecoder()
    
    public init() {
    }
    
    public func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .waniKani
        
        return try decoder.decode(type, from: data)
    }
}

private extension JSONDecoder.DateDecodingStrategy {
    static let waniKani = custom { decoder in
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        
        if let date = waniKaniDateFormatter.date(from: string) {
            return date
        }
        
        throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid date: \(string)")
    }
}
