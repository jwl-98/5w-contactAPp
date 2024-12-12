//
//  PhoneBook+CoreDataClass.swift
//  Pokemon-Contact
//
//  Created by 진욱의 Macintosh on 12/11/24.
//
//

import Foundation
import CoreData
import UIKit

@objc(PhoneBook)
public class PhoneBook: NSManagedObject {
    static let className = "PhoneBook"
    
    enum Key {
        static let name = "name"
        static let phoneNumber = "phoneNumber"
        static let image = "image"
    }

}
