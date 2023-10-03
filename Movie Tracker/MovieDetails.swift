//
//  ContentView.swift
//  Movie Tracker
//
//  Created by Shrinidhi Hegde on 22/08/23.
//

import SwiftUI

struct MovieDetails: View {
    
    @State var movie: Movie
    @Environment(\.presentationMode) var presentationMode
    var newMovie: Bool
    @ObservedObject var movieStorage: MovieStorage
    
    var body: some View {
        List {
            Section {
                SectionTitle(sectionTitle: "Movie Title")
                TextField("Movie Title", text: $movie.title)
            }
            Section {
                SectionTitle(sectionTitle: "Movie Rating")
                HStack {
                    Spacer()
                    Text(String(repeating: "⭐️", count: Int(movie.rating)))
                    Spacer()
                }
                Slider(value: $movie.rating, in: 1...5, step: 1)
            }
            Section {
                SectionTitle(sectionTitle: "Movie Seen")
                Toggle(isOn: $movie.movieSeen) {
                    if movie.title == ""{
                        Text("Enter the movie title")
                    }
                    else {
                        Text("I have seen \(movie.title)")
                    }
                }
            }
            Section {
                
                Button(action:{
                    if self.newMovie {
                        self.movieStorage.movies.append(self.movie)
                    }
                    else {
                        for x in 0..<self.movieStorage.movies.count {
                            if self.movieStorage.movies[x].id == movie.id {
                                self.movieStorage.movies[x] = self.movie
                            }
                        }
                    }
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Spacer()
                        Text("Save").bold()
                        Spacer()
                    }
                }.disabled(movie.title.isEmpty)
                
            }
        }.listStyle(GroupedListStyle())
    }
}

struct MovieDetails_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetails(movie: Movie(), newMovie: true, movieStorage: MovieStorage())
    }
}

struct SectionTitle: View {
    var sectionTitle: String
    
    var body: some View {
        Text(sectionTitle).foregroundColor(.blue).font(.caption)
    }
}
