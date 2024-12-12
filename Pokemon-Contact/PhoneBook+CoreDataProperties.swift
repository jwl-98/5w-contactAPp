//
//  PhoneBook+CoreDataProperties.swift
//  Pokemon-Contact
//
//  Created by 진욱의 Macintosh on 12/11/24.
//
//

import Foundation
import CoreData


extension PhoneBook {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PhoneBook> {
        return NSFetchRequest<PhoneBook>(entityName: "PhoneBook")
    }

    @NSManaged public var name: String?
    @NSManaged public var phoneNumber: String?
    @NSManaged public var image: String?

}

extension PhoneBook : Identifiable {

}
