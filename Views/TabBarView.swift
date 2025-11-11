//
//  TabBarView.swift
//  Apple Music
//
//  Created by Mattia Boccia on 06/11/25.
//

import SwiftUI

struct TabBarView: View {
    @State private var currentSong: Song? = MusicDataService.shared.getSampleSongs().first
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView {
                ListenNowView()
                    .tabItem {
                        Label("Listen Now", systemImage: "play.circle.fill")
                    }
                
                BrowseView()
                    .tabItem {
                        Label("Browse", systemImage: "square.grid.2x2.fill")
                    }
                
                LibraryView()
                    .tabItem {
                        Label("Library", systemImage: "music.note.list")
                    }
                
                SearchView()
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
            }
            .accentColor(.red)
            
            // Mini Player
            //if let song = currentSong {
                //VStack {
                    //Spacer()
                    //MiniPlayerView(song: song)
                        //.padding(.bottom, 50)
               // }
           // }
        }
    }
}

#Preview {
    TabBarView()
}
