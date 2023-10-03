//
//  ContentView.swift
//  Movie Tracker
//
//  Created by Shrinidhi Hegde on 22/08/23.
//

import SwiftUI

struct MovieDetails: View {
    
    @State var title = ""
    @State var rating = 3.0
    @State var movieSeen = false
    var body: some View {
        List {
            Section {
                SectionTitle(sectionTitle: "Movie Title")
                TextField("Movie Title", text: $title)
            }
            Section {
                SectionTitle(sectionTitle: "Movie Rating")
                HStack {
                    Spacer()
                    Text(String(repeating: "⭐️", count: Int(rating)))
                    Spacer()
                }
                    Slider(value: $rating, in: 1...5, step: 1)
            }
            Section {
                SectionTitle(sectionTitle: "Movie Seen")
                Toggle(isOn: $movieSeen) {
                    if title == ""{
                        Text("Enter movie title")
                    }
                    else {
                        Text("I have seen \(title)")
                    }
                }
            }
            Section {
                
                Button(action:{}) {
                    HStack {
                        Spacer()
                        Text("Save").bold()
                        Spacer()
                    }
                }
                
            }
        }.listStyle(GroupedListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetails()
    }
}

struct SectionTitle: View {
    var sectionTitle: String
    
    var body: some View {
        Text(sectionTitle).foregroundColor(.blue).font(.caption)
    }
}
