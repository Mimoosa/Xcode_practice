//
//  ConstituencyDetails.swift
//  ParliamentApp
//
//  Created by Monami Kirjavainen on 15.4.2026.
//

import SwiftUI
import SwiftData

struct ConstituencyDetails: View {
    @Query private var members: [ParliamentMemberModel]
    
    let constituency : String
    
    var partyMembers: [ParliamentMemberModel]{
        members.filter{ member in
            member.constituency.contains(constituency)
        }
    }
    
    var body: some View {
        Image(imageName(for: constituency))
                    .resizable()
                    .scaledToFit()
    }
}

#Preview {
    ConstituencyDetails(constituency: "Häme")
}
