//
//  fetchParliamentMembers.swift
//  ParliamentApp
//
//  Created by Monami Kirjavainen on 13.4.2026.
//  Student number: 2400479
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
}
// Fetches the list of parliament members from the remote JSON endpoint.
// The function decodes the returned JSON into an array of ParliamentMemberStruct.
// Uses JSONDecoder to convert the downloaded JSON data into Swift model objects.
func fetchParliamentMembers() async throws -> [ParliamentMemberStruct] {
    guard let url = URL(string: "https://users.metropolia.fi/~peterh/mps.json") else {
        throw NetworkError.invalidURL
    }
    
    let (data, response) = try await URLSession.shared.data(from: url)

       guard let httpResponse = response as? HTTPURLResponse,
             httpResponse.statusCode == 200 else {
           throw NetworkError.invalidResponse
       }
        
        let decoder = JSONDecoder()
        
        return try decoder.decode([ParliamentMemberStruct].self, from: data)
        
}
