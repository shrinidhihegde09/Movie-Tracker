//
//  Movie_TrackerApp.swift
//  Movie Tracker
//
//  Created by Shrinidhi Hegde on 22/08/23.
//

import SwiftUI

@main
struct Movie_TrackerApp: App {
    var body: some Scene {
        WindowGroup {
            MovieDetails(movie: Movie(), newMovie: true, movieStorage: MovieStorage())
        }
    }
}
