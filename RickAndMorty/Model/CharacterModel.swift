//
//  CharacterModel.swift
//  RickAndMorty
//
//  Created by ozlem on 26.04.2023.
//

import Foundation

// - Character Model

struct CharacterDataModel: Codable {
    let success: Bool?
    let results: [Character]
}

struct Character: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Origin
    let location: Location
    let image: String?
    let episode: [String]?
    let url: String
    let created: String
    
}

struct Origin: Codable {
    let name: String
    let url: String?
}
struct Location: Codable {
    let id: Int?
    let name: String
    let type: String?
    let dimension: String?
    let residents: [String]?
    let url: String?
    let created: String?
}

struct LocationDataModel : Codable{
    let results : [Location]
}

struct EpisodeDataModel: Codable {
    let success: Bool?
    let results: [Episode]
}


struct Episode: Codable {
    
    let id: Int?
    let name: String
    let air_date: String?
    let episode: String
    let characters: [String]?
    let url: String?
    let created: String?
    
}
