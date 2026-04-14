//
//  ParliamentMemberModel.swift
//  ParliamentApp
//
//  Created by Monami Kirjavainen on 13.4.2026.
//

import Foundation
import SwiftData

@Model
class ParliamentMemberModel {
    @Attribute(.unique) var personNumber: Int
    var seatNumber: Int
    var last: String
    var first: String
    var party: String
    var minister: Bool
    var twitter: String?
    var bornYear: Int
    var constituency: String
    
    // Relationshp: one member to many assessments
    @Relationship(deleteRule: .cascade, inverse: \AssessmentModel.member)
    var assessments: [AssessmentModel] = []

    var imgUrl: String {
        "https://users.metropolia.fi/~peterh/edustajakuvat/\(last)-\(first)-web-\(personNumber).jpg"
    }

    init(personNumber: Int, seatNumber: Int, last: String, first: String,
         party: String, minister: Bool, twitter: String?, bornYear: Int,
         constituency: String) {
        self.personNumber = personNumber
        self.seatNumber = seatNumber
        self.last = last
        self.first = first
        self.party = party
        self.minister = minister
        self.twitter = twitter
        self.bornYear = bornYear
        self.constituency = constituency
    }
}


// Converts a decoded API DTO (ParliamentMemberStruct) into a SwiftData model object.
extension ParliamentMemberModel {
    static func fromDTO(_ dto: ParliamentMemberStruct) -> ParliamentMemberModel {
        ParliamentMemberModel(
            personNumber: dto.personNumber,
            seatNumber: dto.seatNumber,
            last: dto.last,
            first: dto.first,
            party: dto.party,
            minister: dto.minister,
            twitter: dto.twitter,
            bornYear: dto.bornYear,
            constituency: dto.constituency
        )
    }
}

