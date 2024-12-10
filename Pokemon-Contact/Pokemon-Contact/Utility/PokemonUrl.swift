//
//  PokemonUrl.swift
//  Pokemon-Contact
//
//  Created by 진욱의 Macintosh on 12/9/24.
//

import Foundation
struct PokemonUrl {
    func createUrl() -> String{
        return "https://pokeapi.co/api/v2/pokemon/\(GenerateID().getId())"
    }
    
}
