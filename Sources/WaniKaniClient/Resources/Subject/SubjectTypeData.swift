import Foundation

public protocol SubjectTypeData {
    var auxiliaryMeanings: [AuxiliaryMeaning] { get }
    var createdAt: Date { get }
    var documentURL: URL { get }
    var hiddenAt: Date? { get }
    var lessonPosition: Int { get }
    var level: Int { get }
    var meaningMnemonic: String { get }
    var meanings: [Meaning] { get }
    var slug: String { get }
}
