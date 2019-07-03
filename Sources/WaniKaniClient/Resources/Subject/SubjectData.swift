@dynamicMemberLookup
public enum SubjectData: Equatable {
    case radical(Radical)
    case kanji(Kanji)
    case vocabulary(Vocabulary)
    
    public subscript<T>(dynamicMember keyPath: KeyPath<SubjectTypeData, T>) -> T {
        let subject: SubjectTypeData
        switch self {
        case let .radical(r):
            subject = r
        case let .kanji(k):
            subject = k
        case let .vocabulary(v):
            subject = v
        }
        
        return subject[keyPath: keyPath]
    }
}
