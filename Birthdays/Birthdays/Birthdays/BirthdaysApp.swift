//
//  BirthdaysApp.swift
//  Birthdays
//
//  Created by Monami Kirjavainen on 30.3.2026.
//

import SwiftUI
import SwiftData

@main
struct BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}
