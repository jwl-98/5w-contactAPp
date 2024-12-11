//
//  KRName.swift
//  Pokemon-Contact
//
//  Created by 진욱의 Macintosh on 12/10/24.
//

import Foundation

//포켓몬 한국이름을 가져오기 위한 json데이터 처리 구조체
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
