//
//  Song.swift
//  Apple Music
//
//  Created by Mattia Boccia on 06/11/25.
//

import Foundation

struct Song: Identifiable {
    let id = UUID()
    let title: String
    let artist: String
    let albumName: String
    let albumArt: String
    let duration: TimeInterval
}
