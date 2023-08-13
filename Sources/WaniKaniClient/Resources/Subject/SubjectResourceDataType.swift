public enum SubjectResourceDataType: Equatable {
    case radical(RadicalResourceData)
    case kanji(KanjiResourceData)
    case vocabulary(VocabularyResourceData)
    case kanaVocabulary(KanaVocabularyResourceData)
}
