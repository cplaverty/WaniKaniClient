import Foundation

public protocol SubjectResourceData: Codable, Equatable {
    /// Collection of auxiliary meanings.
    var auxiliaryMeanings: [AuxiliaryMeaning] { get }
    /// Timestamp when the subject was created.
    var createdAt: Date { get }
    /// The page on wanikani.com that provides detailed information about this subject.
    var documentURL: URL { get }
    /// Timestamp when the subject was hidden, indicating associated assignments will no longer appear in
    /// lessons or reviews and that the subject page is no longer visible on wanikani.com.
    var hiddenAt: Date? { get }
    /// The position that the subject appears in lessons. Note that the value is scoped to the level of the
    /// subject, so there are duplicate values across levels.
    var lessonPosition: Int { get }
    /// The level of the subject, from 1 to 60.
    var level: Int { get }
    /// The subject's meaning mnemonic.
    var meaningMnemonic: String { get }
    /// The subject meanings.
    var meanings: [Meaning] { get }
    /// The string that is used when generating the document URL for the subject. Radicals use their meaning,
    /// lowercased. Kanji and vocabulary use their characters.
    var slug: String { get }
    /// Unique identifier of the associated ``SpacedRepetitionSystemResource``.
    var spacedRepetitionSystemID: Int { get }
}
