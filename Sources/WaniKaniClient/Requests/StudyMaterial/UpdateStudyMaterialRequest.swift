import Foundation

/// Updates a study material for a specific ``id``.
public struct UpdateStudyMaterialRequest {
    /// Unique identifier of the study material.
    public var id: Int
    /// Meaning notes specific for the subject.
    public var meaningNote: String?
    /// Reading notes specific for the subject.
    public var readingNote: String?
    /// Meaning synonyms for the subject.
    public var meaningSynonyms: [String]?
    
    public init(id: Int,
                meaningNote: String? = nil,
                readingNote: String? = nil,
                meaningSynonyms: [String]? = nil) {
        self.id = id
        self.meaningNote = meaningNote
        self.readingNote = readingNote
        self.meaningSynonyms = meaningSynonyms
    }
}

extension UpdateStudyMaterialRequest: ResourceUpdateRequest {
    public typealias Resource = StudyMaterialResource
    
    public var url: URL {
        return ResourceEndpoints.shared.studyMaterials.appendingPathComponent("\(id)")
    }
    
    public var httpMethod: String {
        return "PUT"
    }
    
    public var bodyContent: Codable {
        return BodyContent(
            studyMaterial: UpdateStudyMaterialRequestParams(
                meaningNote: meaningNote,
                readingNote: readingNote,
                meaningSynonyms: meaningSynonyms))
    }
    
    private struct BodyContent: Codable {
        var studyMaterial: UpdateStudyMaterialRequestParams
        
        private enum CodingKeys: String, CodingKey {
            case studyMaterial = "study_material"
        }
    }
    
    private struct UpdateStudyMaterialRequestParams: Codable {
        var meaningNote: String?
        var readingNote: String?
        var meaningSynonyms: [String]?
        
        private enum CodingKeys: String, CodingKey {
            case meaningNote = "meaning_note"
            case readingNote = "reading_note"
            case meaningSynonyms = "meaning_synonyms"
        }
    }
}
