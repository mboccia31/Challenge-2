//
//  LibraryView.swift
//  Apple Music
//
//  Created by Mattia Boccia on 06/11/25.
//

import SwiftUI

struct LibraryView: View {
    let songs = MusicDataService.shared.getSampleSongs()
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Recent")) {
                    ForEach(songs) { song in
                        SongRowView(song: song)
                    }
                }
            }
            .navigationTitle("Library")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

struct SongRowView: View {
    let song: Song
    
    var body: some View {
        HStack(spacing: 12) {
            RoundedRectangle(cornerRadius: 4)
                .fill(Color.gray.opacity(0.3))
                .frame(width: 50, height: 50)
                .overlay(
                    Image(systemName: "music.note")
                        .foregroundColor(.gray)
                )
            
            VStack(alignment: .leading, spacing: 4) {
                Text(song.title)
                    .font(.body)
                    .fontWeight(.medium)
                
                Text(song.artist)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Button(action: {}) {
                Image(systemName: "ellipsis")
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    LibraryView()
}
