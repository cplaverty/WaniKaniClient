import Foundation

extension RangeReplaceableCollection where Element == URLQueryItem {
    mutating func appendIfTrue(name: String, condition: Bool?) {
        guard condition == true else { return }
        
        append(URLQueryItem(name: name, value: nil))
    }
    
    mutating func appendIfSet(name: String, date: Date?) {
        guard let date else { return }
        
        append(URLQueryItem(name: name, value: waniKaniDateFormatter.string(from: date)))
    }
    
    mutating func appendIfSet<T>(name: String, value: T?) {
        guard let value else { return }
        
        append(URLQueryItem(name: name, value: "\(value)"))
    }
    
    mutating func appendIfSet(name: String, values: (some Sequence<String>)?) {
        guard let values else { return }
        
        append(URLQueryItem(name: name, value: values.joined(separator: ",")))
    }
    
    mutating func appendIfSet(name: String, values: (some Sequence)?) {
        appendIfSet(name: name, values: values?.lazy.map({ "\($0)" }))
    }
}
