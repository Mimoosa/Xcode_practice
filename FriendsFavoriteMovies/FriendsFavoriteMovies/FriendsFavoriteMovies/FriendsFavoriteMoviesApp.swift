//
//  FriendsFavoriteMoviesApp.swift
//  FriendsFavoriteMovies
//
//  Created by Monami Kirjavainen on 31.3.2026.
//

import SwiftUI
import SwiftData

@main
struct FriendsFavoriteMoviesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            .modelContainer(for: [Friend.self, Movie.self])
        }
    }
}
