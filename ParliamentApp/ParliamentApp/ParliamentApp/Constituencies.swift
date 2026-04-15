//
//  Constituencies.swift
//  ParliamentApp
//
//  Created by Monami Kirjavainen on 15.4.2026.
//

import SwiftUI
import SwiftData

struct Constituencies: View {
    @Query var members: [ParliamentMemberModel]
    
    var constituencies: [String]{
        Array(Set(members.map { $0.constituency })).sorted()
    }
    var body: some View {
            List(constituencies, id: \.self) { constituency in
                NavigationLink {
                    ConstituencyDetails(constituency: constituency)
                } label: {
                    Text(constituency)
                }
            }
            .navigationTitle("Constituencies")
        }
}

#Preview {
    Constituencies()
}
