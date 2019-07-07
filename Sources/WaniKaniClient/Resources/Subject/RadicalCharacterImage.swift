import Foundation

public struct RadicalCharacterImage: Codable, Equatable {
    public let url: URL
    public let metadata: RadicalCharacterImageMetadata
    public let contentType: String
    
    public init(url: URL,
                metadata: RadicalCharacterImageMetadata,
                contentType: String) {
        self.url = url
        self.metadata = metadata
        self.contentType = contentType
    }
    
    private enum CodingKeys: String, CodingKey {
        case url
        case metadata
        case contentType = "content_type"
    }
}
