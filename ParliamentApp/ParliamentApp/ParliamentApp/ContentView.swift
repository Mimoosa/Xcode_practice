//
//  ContentView.swift
//  ParliamentApp
//
//  Created by Monami Kirjavainen on 13.4.2026.
//  Student number: 2400479
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var members: [ParliamentMemberModel]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 48) {
                Text("Finnish Parliament")
                    .font(.largeTitle.bold())
                    .multilineTextAlignment(.center)
                    .padding(.top, 40)
                
                Image(systemName: "building.columns")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.gray)
                    .padding(.bottom, 10)
                
                
                
                NavigationLink{
                    MainTabView()
                    
                } label:{
                    Text("Start App")
                        .font(.headline)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 32)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .shadow(radius: 3)
                }
            }
            .padding()
        }
        .task {
            if members.isEmpty {
                await loadMembers()
            }
        }
    }
    
    @MainActor
    func loadMembers() async {
        do {
            let dtos = try await fetchParliamentMembers()
            
            for dto in dtos {
                let model = ParliamentMemberModel.fromDTO(dto)
                modelContext.insert(model)
            }
            
            try modelContext.save()
        } catch {
            print("Failed to load members:", error)
        }
    }
}

#Preview {
    ContentView()
}
