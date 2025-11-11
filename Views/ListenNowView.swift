//
//  ListenNowView.swift
//  Apple Music
//
//  Created by Mattia Boccia on 06/11/25.
//

import SwiftUI

struct AlbumCardView: View {
    let album: Album
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray.opacity(0.3))
                .frame(width: 160, height: 160)
                .overlay(
                    Image(systemName: "music.note")
                        .font(.system(size: 40))
                        .foregroundColor(.gray)
                )
            
            Text(album.name)
                .font(.subheadline)
                .fontWeight(.medium)
                .lineLimit(1)
            
            Text(album.artist)
                .font(.caption)
                .foregroundColor(.secondary)
                .lineLimit(1)
        }
        .frame(width: 160)
    }
}


struct ListenNowView: View {
    let albums = MusicDataService.shared.getSampleAlbums()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Recently Played Section
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Recently Played")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(albums) { album in
                                    AlbumCardView(album: album)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    // Quick Picks Section
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Made For You")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(albums) { album in
                                    AlbumCardView(album: album)
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                    }
                    
                    // Quick Picks Section
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Funk")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(albums) { album in
                                    AlbumCardView(album: album)
                                    
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                    }
                    
                }
                .padding(.vertical)
            }
            .navigationTitle("Home")
        }
    }
}


#Preview {
    ListenNowView()
}
