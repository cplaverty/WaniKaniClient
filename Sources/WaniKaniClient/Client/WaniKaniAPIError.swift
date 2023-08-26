struct WaniKaniAPIError: Codable, Equatable {
    var error: String
    var code: Int
}

extension WaniKaniAPIError: CustomStringConvertible {
    var description: String {
        return "\(error) (code \(code))"
    }
}
