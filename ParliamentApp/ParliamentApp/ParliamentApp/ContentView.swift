//
//  ContentView.swift
//  ParliamentApp
//
//  Created by Monami Kirjavainen on 13.4.2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 48) {
                Text("Finnish Parliament App")
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
                    Parties()
                    
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
    }
}

#Preview {
    ContentView()
}
