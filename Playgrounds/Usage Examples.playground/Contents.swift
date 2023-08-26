import _Concurrency
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

import Foundation
import WaniKaniClient

// Using the API requires a WaniKani API key. Once logged into your WaniKani account, these can be found at:
// https://www.wanikani.com/settings/personal_access_tokens
// Once you have your API key, replace the dummy API key below with your API key.
let apiKey = "00000000-0000-0000-0000-000000000000"

guard apiKey != "00000000-0000-0000-0000-000000000000" else {
    fatalError("You must update the apiKey variable with your WaniKani API key!")
}

let client = WaniKaniClient(apiKey: apiKey)

Task {
    do {
        // Get user information
        let userRequest = GetUserRequest()
        let user = try await client.resource(for: userRequest)
        print("Username is \(user.data.username), level \(user.data.level)")
        
        // Get a specific subject
        let subjectRequest = GetSubjectRequest(id: 1)
        let groundRadical = try await client.resource(for: subjectRequest)
        print("Received subject of type \(groundRadical.objectType) with ID \(groundRadical.id)")
        
        // Get a collection of subjects
        let subjectsRequest = GetAllSubjectsRequest(types: [.radical, .kanji], levels: Array(1...3))
        for try await subjectsCollection in client.resources(for: subjectsRequest) {
            print("Received \(subjectsCollection.data.count) subjects")
        }
    } catch {
        fatalError("API error: \(error)")
    }
    
    PlaygroundPage.current.finishExecution()
}
