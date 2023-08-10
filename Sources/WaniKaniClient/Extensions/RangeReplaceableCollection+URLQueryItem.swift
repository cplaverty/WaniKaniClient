import Foundation

extension RangeReplaceableCollection where Element == URLQueryItem {
    mutating func appendItemIfSet<T>(name: String, value: T?) {
        guard let value = value else { return }
        
        append(URLQueryItem(name: name, value: "\(value)"))
    }
    
    mutating func appendItemIfSet(name: String, value: Date?) {
        guard let value = value else { return }
        
        append(URLQueryItem(name: name, value: waniKaniDateFormatter.string(from: value)))
    }
    
    mutating func appendItemsIfSet(name: String, values: [String]?) {
        guard let values = values else { return }
        
        append(URLQueryItem(name: name, value: values.joined(separator: ",")))
    }
    
    mutating func appendItemsIfSet<T>(name: String, values: [T]?) {
        guard let values = values else { return }
        
        append(URLQueryItem(name: name, value: values.lazy.map({ "\($0)" }).joined(separator: ",")))
    }
}
