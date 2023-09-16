import Foundation

/// Encodes WaniKani resources to their JSON representation.
final class ResourceEncoder {
    public static let shared = ResourceEncoder()
    
    public init() {
    }
    
    /// Encodes the given WaniKani resource and returns its JSON representation.
    ///
    /// - Parameter value: The value to encode.
    /// - Returns: A new `Data` value containing the encoded JSON data.
    public func encode<T: Encodable>(_ value: T) throws -> Data {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .waniKani
        encoder.nonConformingFloatEncodingStrategy = .throw
        encoder.outputFormatting = [.sortedKeys, .withoutEscapingSlashes]
        
        return try encoder.encode(value)
    }
}

private extension JSONEncoder.DateEncodingStrategy {
    static let waniKani = custom { (date, encoder) in
        let string = waniKaniDateFormatter.string(from: date)
        
        var container = encoder.singleValueContainer()
        try container.encode(string)
    }
}
