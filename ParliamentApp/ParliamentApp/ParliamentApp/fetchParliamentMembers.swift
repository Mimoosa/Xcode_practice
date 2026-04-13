//
//  fetchParliamentMembers.swift
//  ParliamentApp
//
//  Created by Monami Kirjavainen on 13.4.2026.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
}

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
