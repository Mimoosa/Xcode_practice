//
//  FilteredMovieList.swift
//  FriendsFavoriteMovies
//
//  Created by Monami Kirjavainen on 7.4.2026.
//

import SwiftUI
import SwiftData


struct FilteredMovieList: View {
    @State private var searchText = ""


    var body: some View {
        NavigationSplitView{
            MovieList(titleFilter: searchText)
                .searchable(text: $searchText)
        } detail: {
            Text("Select a movie")
                .navigationTitle("Movie")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    FilteredMovieList()
        .modelContainer(SampleData.shared.modelContainer)
}
