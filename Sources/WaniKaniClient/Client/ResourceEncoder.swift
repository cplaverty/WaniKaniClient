import Foundation

open class ResourceEncoder {
    public static var shared = ResourceEncoder()
    
    public init() {
    }
    
    public func encode<T: Encodable>(_ value: T) throws -> Data {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .waniKani
        encoder.nonConformingFloatEncodingStrategy = .throw
        if #available(iOS 11.0, OSX 10.13, tvOS 11.0, watchOS 4.0, *) {
            encoder.outputFormatting = .sortedKeys
        }
        
        return try encoder.encode(value)
    }
}

private extension JSONEncoder.DateEncodingStrategy {
    static let waniKani = custom { (date, encoder) in
        let string = DateFormatter.iso8601.string(from: date)
        
        var container = encoder.singleValueContainer()
        try container.encode(string)
    }
}
