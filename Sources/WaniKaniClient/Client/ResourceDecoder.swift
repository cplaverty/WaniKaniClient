import Foundation

/// Decodes WaniKani resources from their JSON representation.
final class ResourceDecoder {
    public static let shared = ResourceDecoder()
    
    public init() {
    }
    
    /// Decodes a WaniKani resource of the given type from the given JSON representation.
    ///
    /// - Parameters:
    ///   - type: The type of the resource to decode.
    ///   - data: The data to decode from.
    /// - Returns: A value of the requested type.
    /// - Throws: `DecodingError.dataCorrupted` if values requested from the payload are corrupted, or if the given data is not valid JSON.
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
