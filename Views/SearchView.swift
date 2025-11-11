//
//  SearchView.swift
//  Apple Music
//
//  Created by Mattia Boccia on 06/11/25.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    let songs = MusicDataService.shared.getSampleSongs()
    
    var filteredSongs: [Song] {
        if searchText.isEmpty {
            return songs
        } else {
            return songs.filter { 
                $0.title.localizedCaseInsensitiveContains(searchText) ||
                $0.artist.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if searchText.isEmpty {
                    // Search Suggestions
                    ScrollView {
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Recent Searches")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.horizontal)
                            
                            ForEach(songs.prefix(5)) { song in
                                SearchSuggestionRow(song: song)
                            }
                        }
                        .padding(.vertical)
                    }
                } else {
                    // Search Results
                    List(filteredSongs) { song in
                        SongRowView(song: song)
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Search")
            .searchable(text: $searchText, prompt: "Artists, Songs, Albums")
        }
    }
}

struct SearchSuggestionRow: View {
    let song: Song
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .frame(width: 30)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(song.title)
                    .font(.body)
                Text(song.artist)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "arrow.right")
                .foregroundColor(.gray)
                .font(.caption)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}

#Preview {
    SearchView()
}
