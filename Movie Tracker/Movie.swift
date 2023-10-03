//
//  Movie.swift
//  Movie Tracker
//
//  Created by Shrinidhi Hegde on 23/08/23.
//

import Foundation

struct Movie: Identifiable {
    var id = UUID()
    var title = ""
    var rating = 3.0
    var movieSeen = false
}

class MovieStorage: ObservableObject {
    @Published var movies = [Movie]()
}
