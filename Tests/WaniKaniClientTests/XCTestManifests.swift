import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        // Client
        testCase(ResourceDecoderTests.allTests),
        testCase(WaniKaniClientTests.allTests),
        
        // Requests
        testCase(GetAllAssignmentsRequestTests.allTests),
        testCase(GetAssignmentRequestTests.allTests),
        testCase(GetAllLevelProgressionsRequestTests.allTests),
        testCase(GetLevelProgressionRequestTests.allTests),
        testCase(GetAllResetsRequestTests.allTests),
        testCase(GetResetRequestTests.allTests),
        testCase(GetAllReviewsRequestTests.allTests),
        testCase(GetReviewRequestTests.allTests),
        testCase(GetAllReviewStatisticsRequestTests.allTests),
        testCase(GetReviewStatisticRequestTests.allTests),
        testCase(GetAllStudyMaterialsRequestTests.allTests),
        testCase(GetStudyMaterialRequestTests.allTests),
        testCase(GetAllSubjectsRequestTests.allTests),
        testCase(GetSubjectRequestTests.allTests),
        testCase(GetUserRequestTests.allTests),
        
        // Resources
        testCase(AssignmentTests.allTests),
        testCase(KanjiTests.allTests),
        testCase(LevelProgressionTests.allTests),
        testCase(RadicalTests.allTests),
        testCase(ResetTests.allTests),
        testCase(ResourceCollectionTests.allTests),
        testCase(ReviewStatisticTests.allTests),
        testCase(ReviewTests.allTests),
        testCase(StudyMaterialTests.allTests),
        testCase(UserTests.allTests),
        testCase(VocabularyTests.allTests),
    ]
}
#endif
