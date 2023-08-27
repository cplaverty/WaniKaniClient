import Foundation

/// Creates a study material for a specific ``subjectID``.
///
/// The owner of the api key can only create one ``StudyMaterialResource`` per ``subjectID``.
public struct CreateStudyMaterialRequest {
    /// Unique identifier of the associated ``SubjectResource``.
    public var subjectID: Int
    /// Meaning notes specific for the subject.
    public var meaningNote: String?
    /// Reading notes specific for the subject.
    public var readingNote: String?
    /// Meaning synonyms for the subject.
    public var meaningSynonyms: [String]?
    
    public init(subjectID: Int,
                meaningNote: String? = nil,
                readingNote: String? = nil,
                meaningSynonyms: [String]? = nil) {
        self.subjectID = subjectID
        self.meaningNote = meaningNote
        self.readingNote = readingNote
        self.meaningSynonyms = meaningSynonyms
    }
}

extension CreateStudyMaterialRequest: ResourceUpdateRequest, Codable {
    public typealias Resource = StudyMaterialResource
    
    public var url: URL {
        return ResourceEndpoints.shared.studyMaterials
    }
    
    public var httpMethod: String {
        return "POST"
    }
    
    public var bodyContent: Codable {
        return BodyContent(studyMaterial: self)
    }
    
    private enum CodingKeys: String, CodingKey {
        case subjectID = "subject_id"
        case meaningNote = "meaning_note"
        case readingNote = "reading_note"
        case meaningSynonyms = "meaning_synonyms"
    }
    
    private struct BodyContent: Codable {
        var studyMaterial: CreateStudyMaterialRequest
        
        private enum CodingKeys: String, CodingKey {
            case studyMaterial = "study_material"
        }
    }
}
