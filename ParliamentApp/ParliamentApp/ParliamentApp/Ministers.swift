//
//  Ministers.swift
//  ParliamentApp
//
//  Created by Monami Kirjavainen on 15.4.2026.
//  Student number: 2400479
//

import SwiftUI
import SwiftData

struct Ministers: View {
    @Query var members: [ParliamentMemberModel]

    var ministerMembers: [ParliamentMemberModel] {
        members.filter { $0.minister == true }
    }

    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Ministers")
                .font(.title2)
                .bold()
                .padding(.horizontal)
            
            List(ministerMembers, id: \.personNumber) { member in
                NavigationLink {
                    MemberDetails(personNumber: member.personNumber)
                } label: {
                    Text("\(member.first) \(member.last)")
                }
            }
        }
    }

}

#Preview {
    Ministers()
}
