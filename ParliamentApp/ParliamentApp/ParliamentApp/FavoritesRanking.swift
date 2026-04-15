//
//  FavoritesRanking.swift
//  ParliamentApp
//
//  Created by Monami Kirjavainen on 15.4.2026.
//  Student number: 2400479
//

import SwiftUI
import SwiftData

struct FavoritesRanking: View {
    @Query var members: [ParliamentMemberModel]
    
    var rankedMembers: [ParliamentMemberModel] {
        members.sorted { $0.totalScore > $1.totalScore }
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text("Ranking")
                .font(.title2)
                .bold()
                .padding(.horizontal)
            
            List(rankedMembers, id: \.personNumber) { member in
                NavigationLink {
                    MemberDetails(personNumber: member.personNumber)
                } label: {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(member.first) \(member.last)")
                                .font(.headline)
                            Text(member.party)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        Text("\(member.totalScore)")
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
    }
}

#Preview {
    FavoritesRanking()
}
