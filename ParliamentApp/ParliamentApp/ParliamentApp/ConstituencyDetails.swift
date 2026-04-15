//
//  ConstituencyDetails.swift
//  ParliamentApp
//
//  Created by Monami Kirjavainen on 15.4.2026.
// Student number: 2400479
//

import SwiftUI
import SwiftData

struct ConstituencyDetails: View {
    @Query private var members: [ParliamentMemberModel]
    
    let constituency : String
    
    var constituencyMembers: [ParliamentMemberModel]{
        members.filter{ member in
            member.constituency.contains(constituency)
        }
    }
    
    var body: some View {
        List {
            // Display constituency image from Assets.
            // Each constituency has a corresponding image stored in the app's asset catalog.
            Image(imageName(for: constituency))
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 200)
                .frame(maxWidth: .infinity, alignment: .center)
                .listRowInsets(EdgeInsets())
                .padding(10)


            Section("Constituency Members") {
                ForEach(constituencyMembers, id: \.id) { member in
                    NavigationLink {
                        MemberDetails(personNumber: member.personNumber)
                    } label: {
                        Text("\(member.first) \(member.last)")
                    }
                }
            }
        }
        .navigationTitle("Constituency: \(constituency)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ConstituencyDetails(constituency: "Häme")
}
