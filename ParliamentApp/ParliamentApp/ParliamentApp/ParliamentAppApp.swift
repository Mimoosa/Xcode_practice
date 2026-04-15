//
//  ParliamentAppApp.swift
//  ParliamentApp
//
//  Created by Monami Kirjavainen on 13.4.2026.
//  Student number: 2400479
//

import SwiftUI
import SwiftData

@main
struct ParliamentAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: [ParliamentMemberModel.self, AssessmentModel.self])
    }
}
