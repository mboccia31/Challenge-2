//
//  Album.swift
//  Apple Music
//
//  Created by Mattia Boccia on 06/11/25.
//

import Foundation

struct Album: Identifiable {
    let id = UUID()
    let name: String
    let artist: String
    let coverArt: String
    let releaseYear: Int
    let songs: [Song]
}
