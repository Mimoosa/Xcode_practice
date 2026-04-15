//
//  ParliamentMember.swift
//  ParliamentApp
//
//  Created by Monami Kirjavainen on 13.4.2026.
//  Student number: 2400479
//

import Foundation

struct ParliamentMemberStruct: Codable{
    let personNumber: Int
    let seatNumber: Int
    let last: String
    let first: String
    let party: String
    let minister: Bool
    // Twitter may be an empty string, so use an empty default value.
    let twitter: String?
    let bornYear: Int
    let constituency: String
    // Picture URL is constructed manually using last name, first name, and personNumber.
    var imgUrl: String {
        "https://users.metropolia.fi/~peterh/edustajakuvat/\(last)-\(first)-web-\(personNumber).jpg"
    }
}
