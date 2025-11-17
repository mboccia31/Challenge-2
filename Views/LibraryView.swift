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
            VStack(spacing: 0) {
                
            
                HStack(alignment: .center) {
                    Text("Songs")
                        .font(.largeTitle).bold()
                    
                    Spacer()
                    
                    Image("profile")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 36, height: 36)
                        .clipShape(Circle())
                }
                .padding(.horizontal)
                .padding(.top, 8)
                
               
                List {
                    Section(header: Text("")) {
                        ForEach(songs) { song in
                            SongRowView(song: song)
                        }
                    }
                }
                .listStyle(.insetGrouped)
                .scrollContentBackground(.hidden)

            }
            
        }
    }
}


struct SongRowView: View {
    let song: Song
    
    var body: some View {
        HStack(spacing: 25) {
            RoundedRectangle(cornerRadius: 4)
                .fill(Color.gray.opacity(0.3))
                .frame(width: 20, height: 10)
                .overlay(
                    Image(song.albumArt)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
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
