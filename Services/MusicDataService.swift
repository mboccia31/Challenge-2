//
//  MusicDataService.swift
//  Apple Music
//
//  Created by Mattia Boccia on 06/11/25.
//

import Foundation

class MusicDataService {
    static let shared = MusicDataService()
    
    private init() {}
    
    func getSampleSongs() -> [Song] {
        return [
            Song(title: "Blinding Lights", artist: "The Weeknd", albumName: "After Hours", albumArt: "album1", duration: 200),
            Song(title: "Levitating", artist: "Dua Lipa", albumName: "Future Nostalgia", albumArt: "album2", duration: 203),
            Song(title: "Save Your Tears", artist: "The Weeknd", albumName: "After Hours", albumArt: "album1", duration: 215),
            Song(title: "Good 4 U", artist: "Olivia Rodrigo", albumName: "SOUR", albumArt: "album3", duration: 178),
            Song(title: "Stay", artist: "The Kid LAROI", albumName: "F*ck Love 3", albumArt: "album4", duration: 141)
        ]
    }
    
    func getSampleAlbums() -> [Album] {
        return [
            Album(name: "After Hours", artist: "The Weeknd", coverArt: "album1", releaseYear: 2020, songs: []),
            Album(name: "Future Nostalgia", artist: "Dua Lipa", coverArt: "album2", releaseYear: 2020, songs: []),
            Album(name: "SOUR", artist: "Olivia Rodrigo", coverArt: "album3", releaseYear: 2021, songs: []),
            Album(name: "F*ck Love 3", artist: "The Kid LAROI", coverArt: "album4", releaseYear: 2021, songs: [])
        ]
    }
}
