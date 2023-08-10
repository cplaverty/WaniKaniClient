import Foundation

open class ResourceEncoder {
    public static var shared = ResourceEncoder()
    
    public init() {
    }
    
    public func encode<T: Encodable>(_ value: T) throws -> Data {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .waniKani
        encoder.nonConformingFloatEncodingStrategy = .throw
        encoder.outputFormatting = .sortedKeys
        
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
