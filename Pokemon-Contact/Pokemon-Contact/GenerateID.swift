//
//  File.swift
//  Pokemon-Contact
//
//  Created by 진욱의 Macintosh on 12/9/24.
//

import Foundation

struct GenerateID {
     func getId() -> Int {
        return Int.random(in: 1...1025)
    }
    
}
