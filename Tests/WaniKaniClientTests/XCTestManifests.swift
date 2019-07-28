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
        testCase(AssignmentResourceTests.allTests),
        testCase(KanjiResourceTests.allTests),
        testCase(LevelProgressionResourceTests.allTests),
        testCase(RadicalResourceTests.allTests),
        testCase(ResetResourceTests.allTests),
        testCase(ResourceCollectionTests.allTests),
        testCase(ReviewResourceTests.allTests),
        testCase(ReviewStatisticResourceTests.allTests),
        testCase(StudyMaterialResourceTests.allTests),
        testCase(UserResourceTests.allTests),
        testCase(VocabularyResourceTests.allTests),
    ]
}
#endif
