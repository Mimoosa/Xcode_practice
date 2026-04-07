//
//  MovieDetail.swift
//  FriendsFavoriteMovies
//
//  Created by Monami Kirjavainen on 7.4.2026.
//

import SwiftUI
import SwiftData

struct MovieDetail: View {
    @Bindable var movie: Movie
    let isNew: Bool
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    init(movie: Movie, isNew: Bool = false){
        self.movie = movie
        self.isNew = isNew
    }
    
    var sortedFriends: [Friend]{
        movie.favoritedBy.sorted{first, second in
            first.name < second.name
        }
    }
    
    var body: some View {
        Form {
            TextField("Movie title", text: $movie.title)
            
            DatePicker("Release date", selection: $movie.releaseDate, displayedComponents: .date)
            
            if !movie.favoritedBy.isEmpty {
                Section("Favorited by"){
                    ForEach(sortedFriends){friend in
                        Text(friend.name)
                    }
                }
            }
        }
        .navigationTitle(isNew ? "Add Movie" :"Movie")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            if isNew {
                ToolbarItem(placement: .cancellationAction){
                    Button("Cancel") {
                        context.delete(movie)
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        MovieDetail(movie: SampleData.shared.movie)
    }
}

#Preview("New Movie") {
    NavigationStack {
        MovieDetail(movie: SampleData.shared.movie, isNew: true)
    }
}
