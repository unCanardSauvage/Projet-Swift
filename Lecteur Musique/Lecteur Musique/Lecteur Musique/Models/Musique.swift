//
//  Musique.swift
//  Lecteur Musique
//
//  Created by Armand Audeoud on 28/01/2021.
//


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
class Playlist: Codable {
    let playlist: [Morceau]

    init(playlist: [Morceau]) {
        self.playlist = playlist
    }
}

// MARK: - Result
class Morceau: Codable {
    let titre, artiste, musique, image: String

    init(titre: String, artiste: String, musique: String, image: String) {
        self.titre = titre
        self.artiste = artiste
        self.musique = musique
        self.image = image
    }
}
