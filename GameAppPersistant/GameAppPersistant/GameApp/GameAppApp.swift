//
//  GameAppApp.swift
//  GameApp
//
//  Created by Monami Kirjavainen on 27.3.2026.
//  Updated by Monami on 31.3.2026
//

import SwiftUI
import SwiftData

@main
struct GameAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: PlayerScore.self)
        }
    }
}
