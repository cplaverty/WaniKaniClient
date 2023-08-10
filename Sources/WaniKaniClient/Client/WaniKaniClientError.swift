import Foundation

public enum WaniKaniClientError: Error {
    case invalidServerResponse
    case invalidAPIKey
    case tooManyRequests
    case apiError(error: String, code: Int)
    case unknownError(httpStatusCode: Int, message: String)
    case unhandledStatusCode(httpStatusCode: Int, data: Data?)
}

extension WaniKaniClientError: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let error = try container.decode(String.self, forKey: .error)
        let code = try container.decode(Int.self, forKey: .code)
        
        self = .apiError(error: error, code: code)
    }
    
    private enum CodingKeys: String, CodingKey {
        case error
        case code
    }
}

extension WaniKaniClientError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidServerResponse:
            return "An invalid response was returned by the WaniKani API"
        case .invalidAPIKey:
            return "The API key is invalid"
        case .tooManyRequests:
            return "Too many requests have been made for this account to the WaniKani API. Please try your request again later."
        case let .apiError(error: error, code: code):
            return "\(error) (code \(code))"
        case let .unknownError(httpStatusCode: httpStatusCode, message: message):
            return "Received an unexpected response code \(httpStatusCode) from the API. Message: \(message)"
        case let .unhandledStatusCode(httpStatusCode: httpStatusCode, data: _):
            return "An unknown error has occurred communicating with the WaniKani API (response code \(httpStatusCode) received)"
        }
    }
}
