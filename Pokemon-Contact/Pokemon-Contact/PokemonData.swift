//
//  PokemonData.swift
//  Pokemon-Contact
//
//  Created by 진욱의 Macintosh on 12/9/24.
//


import Foundation
//sprites그룹의 officialArtWork 이미지 사용

struct PokemonData: Codable {
    let id: Int
    let name: String
    let sprites: ItemSprites
}

struct ItemSprites: Codable {
    let other: Other
}

struct Other: Codable{
    let officialArtWork: OfficialArtWork
    
    enum CodingKeys: String, CodingKey{
        case officialArtWork = "official-artwork"
    }
}

struct OfficialArtWork: Codable {
    let frontDefault: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}
