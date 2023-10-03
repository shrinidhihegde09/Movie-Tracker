//
//  MovieList.swift
//  Movie Tracker
//
//  Created by Shrinidhi Hegde on 23/08/23.
//

import SwiftUI

struct MovieList: View {
    @ObservedObject var movieStorage = MovieStorage()
    
    var body: some View {
            NavigationView {
                List(movieStorage.movies) { currentMovie in
                    NavigationLink( destination: MovieDetails(movie: currentMovie, newMovie: false, movieStorage: self.movieStorage)){
                        Text(currentMovie.title)
                    }
                }.navigationBarTitle("Movies").navigationBarItems(trailing:
                                                                    NavigationLink(destination: MovieDetails(movie: Movie(), newMovie: true, movieStorage: self.movieStorage)) {
                    Image(systemName: "plus")
                }
                
                )
        }
    }
}
struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList()
    }
}
