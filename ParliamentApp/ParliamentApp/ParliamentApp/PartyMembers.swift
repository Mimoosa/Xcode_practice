//
//  PartyMembers.swift
//  ParliamentApp
//
//  Created by Monami Kirjavainen on 13.4.2026.
//

import SwiftUI
import SwiftData

struct PartyMembers: View {
    @Query var members: [ParliamentMemberModel]
    
    let party: String
    
    var partyMembers: [ParliamentMemberModel]{
        members.filter{ member in
            member.party.contains(party)
        }
    }
    
    
    var body: some View {
        List(partyMembers, id: \.personNumber) { member in
            NavigationLink {
                MemberDetails(personNumber: member.personNumber, party: party)
            } label: {
                Text("\(member.first) \(member.last)")
            }
        }
        .navigationTitle("Party Members: \(party.uppercased())")
    }
}

#Preview {
    PartyMembers(party: "SOK")
}
