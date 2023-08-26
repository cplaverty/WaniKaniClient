# WaniKaniClient

Client for the WaniKani v2 API.

Documentation for the WaniKani API can be found at: https://docs.api.wanikani.com/20170710

## Requirements

- iOS 15.0+ / macOS 12.0+ / tvOS 15.0+
- Swift 5.8+

## Usage

### Create client

```swift
import WaniKaniClient

// Using the API requires a WaniKani API key. Once logged into your WaniKani account,
// these can be found at: https://www.wanikani.com/settings/personal_access_tokens
let apiKey = "<your WaniKani API key here>"
let client = WaniKaniClient(apiKey: apiKey)
```

### Retrieve single resource

Fetching single resources from the WaniKani API uses `WaniKaniClient.resource(for:)`, passing a request object that contains the parameters for the resource request.

For example, retrieving user details would be done through passing a `GetUserRequest` object, which does not accept parameters.

```swift
let userRequest = GetUserRequest()
let user = try await client.resource(for: userRequest)
print("Username is \(user.data.username), level \(user.data.level)")
```

For requests which support or require parameters, these parameters are passed to the request initialiser. For example, to retrieve the subject which has an ID of 1:

```swift
let subjectRequest = GetSubjectRequest(id: 1)
let groundRadical = try await client.resource(for: subjectRequest)
print("Received subject of type \(groundRadical.objectType) with ID \(groundRadical.id)")
```

### Retrieve resource collections

Fetching resource collections from the WaniKani API uses `WaniKaniClient.resources(for:)`. Here, we load all radicals and kanji from levels 1 to 3:

```swift
let subjectsRequest = GetAllSubjectsRequest(types: [.radical, .kanji], levels: Array(1...3))
for try await subjectsCollection in client.resources(for: subjectsRequest) {
    print("Received \(subjectsCollection.data.count) subjects")
}
```

### Update single resource

Updating a single resource through the WaniKani API uses `WaniKaniClient.updateResource(for:)`, passing a request object that contains the parameters for the resource update request.

For example, creating a review would be done through passing a `CreateReviewRequest` object. Here, we create a review for the subject which has an ID of 1:

```swift
let createReviewRequest = CreateReviewRequest(subjectID: 1, incorrectMeaningAnswers: 0, incorrectReadingAnswers: 0)
let createdReview = try await client.updateResource(for: createReviewRequest)
print("The SRS stage changed from \(createdReview.data.startingSRSStage) to \(createdReview.data.endingSRSStage)")
```
