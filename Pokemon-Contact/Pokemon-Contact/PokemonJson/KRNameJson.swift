//
//  KRName.swift
//  Pokemon-Contact
//
//  Created by 진욱의 Macintosh on 12/10/24.
//

import Foundation

struct KRNameJson: Codable {
    let names: [Name]
}

struct Name: Codable {
    let name: String
    let language: Language
}
struct Language: Codable {
    let name: String
}
