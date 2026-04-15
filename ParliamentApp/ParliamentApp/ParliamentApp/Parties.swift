//
//  Parties.swift
//  ParliamentApp
//
//  Created by Monami Kirjavainen on 13.4.2026.
//  Student number: 2400479
//

import SwiftUI
import SwiftData

struct Parties: View {
    @Query var members: [ParliamentMemberModel]
    
    var parties: [String]{
        Array(Set(members.map { $0.party })).sorted()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Parties")
                .font(.title2)
                .bold()
                .padding(.horizontal)

            List(parties, id: \.self) { party in
                NavigationLink {
                    PartyMembers(party: party)
                } label: {
                    Text(party.uppercased())
                }
            }
        }
    }

}

#Preview {
    Parties()
}
