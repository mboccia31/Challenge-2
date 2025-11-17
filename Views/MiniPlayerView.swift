//
//  MiniPlayerView.swift
//  Apple Music
//
//  Created by Mattia Boccia on 06/11/25.
//

import SwiftUI

struct MiniPlayerView: View {
    let song: Song
    @State private var isPlaying = false
    
    var body: some View {
        HStack(spacing: 12) {
            // Album Art
            RoundedRectangle(cornerRadius: 6)
                .fill(Color.gray.opacity(0.3))
                .frame(width: 35, height: 35)
                .overlay(
                    Image(systemName: "music.note")
                        .foregroundColor(.gray)
                )
            
            // Song Info
            VStack(alignment: .leading, spacing: 2) {
                Text(song.title)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .lineLimit(1)
                
                Text(song.artist)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
            
            Spacer()
            
            // Play/Pause Button
            Button(action: {
                isPlaying.toggle()
            }) {
                Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                    .font(.title3)
                    .foregroundColor(.primary)
            }
            .padding(.trailing, 8)
            
            // Next Button
            Button(action: {}) {
                Image(systemName: "forward.fill")
                    .font(.title3)
                    .foregroundColor(.primary)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(
            RoundedRectangle(cornerRadius: 120)
                .fill(Color(.systemGray6))
        )
        .padding(.horizontal, 8)
    }
}

#Preview {
    MiniPlayerView(song: Song(title: "Blinding Lights", artist: "The Weeknd", albumName: "After Hours", albumArt: "BlindingLights", duration: 200))
}
