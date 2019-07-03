import Foundation

public struct RadicalCharacterImage: Codable, Equatable {
    public let url: URL
    public let metadata: RadicalCharacterImageMetadata
    public let contentType: String
    
    private enum CodingKeys: String, CodingKey {
        case url
        case metadata
        case contentType = "content_type"
    }
}
