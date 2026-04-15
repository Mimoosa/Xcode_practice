//
//  MainTabView.swift
//  ParliamentApp
//
//  Created by Monami Kirjavainen on 15.4.2026.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Parties()
                .tabItem {
                    Label("Parties", systemImage: "flag")
                }


            Constituencies()
                .tabItem {
                    Label("Constituencies", systemImage: "map")
                }
        }
    }
}


