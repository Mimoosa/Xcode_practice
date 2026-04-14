//
//  Parties.swift
//  ParliamentApp
//
//  Created by Monami Kirjavainen on 13.4.2026.
//

import SwiftUI
import SwiftData

struct Parties: View {
    @Query var members: [ParliamentMemberModel]
    
    var parties: [String]{
        Array(Set(members.map { $0.party })).sorted()
    }
    
    var body: some View {
            List(parties, id: \.self) { party in
                NavigationLink {
                    PartyMembers(party: party)
                } label: {
                    Text(party.uppercased())
                }
            }
            .navigationTitle("Parties")
        }
}

#Preview {
    Parties()
}
