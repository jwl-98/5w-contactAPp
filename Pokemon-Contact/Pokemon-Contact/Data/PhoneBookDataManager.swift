//
//  PhoneBookDataManager.swift
//  Pokemon-Contact
//
//  Created by 진욱의 Macintosh on 12/11/24.
//

import Foundation
import CoreData

class PhoneBookDataManager {
    static let dataManager = PhoneBookDataManager()
    private var phoneBookDataArray: [PhoneBookData] = []
    
    func makeData(image: String, name: String, phoneNumber: String) {
        let phoneBookData = PhoneBookData(image: image, name: name, phoneNumber: phoneNumber)
        phoneBookDataArray.append(phoneBookData)
        
        print(phoneBookDataArray.count)
    }
    
    func getPhoneBookData() -> [PhoneBookData] {
        print(#function)
        print(phoneBookDataArray)
        return phoneBookDataArray
    }
}
