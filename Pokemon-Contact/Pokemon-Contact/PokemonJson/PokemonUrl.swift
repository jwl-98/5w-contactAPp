//
//  PokemonUrl.swift
//  Pokemon-Contact
//
//  Created by 진욱의 Macintosh on 12/9/24.
//

import Foundation
//포켓몬 데이터 api url
struct PokemonUrl {
    let id = Int.random(in: 1...1025)
   
    func createUrl() -> String {
        print(id)
        return "https://pokeapi.co/api/v2/pokemon/\(id)"
    }
    //포켓몬 한글이름 api
    func getKrNameURL() -> String {
        return "https://pokeapi.co/api/v2/pokemon-species/\(id)"
    }
}
