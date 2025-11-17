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
           
            Song(title: "Blinding Lights", artist: "The Weeknd", albumName: "After Hours", albumArt: "BlindingLights", duration: 200),
            Song(title: "Levitating", artist: "Dua Lipa", albumName: "Future Nostalgia", albumArt: "DuaLipa", duration: 203),
            Song(title: "Save Your Tears", artist: "The Weeknd", albumName: "After Hours", albumArt: "BlindingLights", duration: 215),
            Song(title: "Good 4 U", artist: "Olivia Rodrigo", albumName: "SOUR", albumArt: "Sour", duration: 178),
            Song(title: "Stay", artist: "The Kid LAROI", albumName: "F*ck Love 3", albumArt: "Kid", duration: 141),
            Song(title: "Don't Start Now", artist: "Dua Lipa", albumName: "Future Nostalgia", albumArt: "DuaLipa", duration: 183),
            Song(title: "Physical", artist: "Dua Lipa", albumName: "Future Nostalgia", albumArt: "DuaLipa", duration: 193),
            Song(title: "In Your Eyes", artist: "The Weeknd", albumName: "After Hours", albumArt: "inyoureyes", duration: 239),
            Song(title: "Heartless", artist: "The Weeknd", albumName: "After Hours", albumArt: "heartless", duration: 200),
            Song(title: "drivers license", artist: "Olivia Rodrigo", albumName: "SOUR", albumArt: "Sour", duration: 242),
            Song(title: "deja vu", artist: "Olivia Rodrigo", albumName: "SOUR", albumArt: "Sour", duration: 215),
            Song(title: "WITHOUT YOU", artist: "The Kid LAROI", albumName: "F*ck Love 3", albumArt: "Kid", duration: 166),
            Song(title: "Thousand Miles", artist: "The Kid LAROI", albumName: "F*ck Love 3", albumArt: "Kid", duration: 202),
            Song(title: "Peaches", artist: "Justin Bieber", albumName: "Justice", albumArt: "peaches", duration: 198),
            Song(title: "Watermelon Sugar", artist: "Harry Styles", albumName: "Fine Line", albumArt: "watermelonsugar", duration: 174),
            Song(title: "As It Was", artist: "Harry Styles", albumName: "Harry's House", albumArt: "asitwas", duration: 167),
            Song(title: "Get Lucky (feat. Pharrell Williams)", artist: "Daft Punk", albumName: "Random Access Memories", albumArt: "daftpunk", duration: 248),
            Song(title: "Lose Yourself to Dance", artist: "Daft Punk", albumName: "Random Access Memories", albumArt: "daftpunk", duration: 333),
            Song(title: "Uptown Funk (feat. Bruno Mars)", artist: "Mark Ronson", albumName: "Uptown Special", albumArt: "uptownfunk", duration: 269),
            Song(title: "Treasure", artist: "Bruno Mars", albumName: "Unorthodox Jukebox", albumArt: "treasure", duration: 179),
            Song(title: "September", artist: "Earth, Wind & Fire", albumName: "The Best of Earth, Wind & Fire, Vol. 1", albumArt: "september", duration: 215),
            Song(title: "Superstition", artist: "Stevie Wonder", albumName: "Talking Book", albumArt: "superstition", duration: 250)
        ]
    }
    
    
    func getSampleAlbums() -> [Album] {
        return [

            Album(name: "After Hours", artist: "The Weeknd", coverArt: "BlindingLights", releaseYear: 2020, songs: []),
            Album(name: "Future Nostalgia", artist: "Dua Lipa", coverArt: "DuaLipa", releaseYear: 2020, songs: []),
            Album(name: "SOUR", artist: "Olivia Rodrigo", coverArt: "Sour", releaseYear: 2021, songs: []),
            Album(name: "F*ck Love 3", artist: "The Kid LAROI", coverArt: "Kid", releaseYear: 2021, songs: []),
            Album(name: "Lose Yourself to Dance", artist: "Daft Punk", coverArt: "daftpunk", releaseYear: 2021, songs: []),
            Album(name: "Justice", artist: "Justin Bieber", coverArt: "Justice", releaseYear: 2021, songs: []),
            
            Album(name: "Fine Line", artist: "Harry Styles", coverArt: "watermelonsugar", releaseYear: 2019, songs: []),
            Album(name: "Harry's House", artist: "Harry Styles", coverArt: "asitwas", releaseYear: 2022, songs: []),
           
            Album(name: "Montero", artist: "Lil Nas X", coverArt: "Montero", releaseYear: 2021, songs: []),
            
            Album(name: "Midnights", artist: "Taylor Swift", coverArt: "Midnights", releaseYear: 2022, songs: []),
            Album(name: "SOS", artist: "SZA", coverArt: "SOS", releaseYear: 2022, songs: []),
            
            Album(name: "Endless Summer Vacation", artist: "Miley Cyrus", coverArt: "ESV", releaseYear: 2023, songs: []),
        
            
            Album(name: "Random Access Memories", artist: "Daft Punk", coverArt: "daftpunk", releaseYear: 2013, songs: []),
            
           
            
            Album(name: "Unorthodox Jukebox", artist: "Bruno Mars", coverArt: "treasure", releaseYear: 2012, songs: []),
            Album(name: "The Best of Earth, Wind & Fire, Vol. 1", artist: "Earth, Wind & Fire", coverArt: "september", releaseYear: 1978, songs: []),
            Album(name: "Talking Book", artist: "Stevie Wonder", coverArt: "TalkingBook", releaseYear: 1972, songs: [])
        ]
    }
}
