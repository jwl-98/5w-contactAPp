//
//  PhoneBookDataManager.swift
//  Pokemon-Contact
//
//  Created by 진욱의 Macintosh on 12/11/24.
//

import CoreData
import UIKit

class PhoneBookDataManager {
    static let dataManager = PhoneBookDataManager()
    private var phoneBookDataArray: [PhoneBookData] = []
    var container: NSPersistentContainer!
    
    init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.container = appDelegate.persistentContainer
    }
    
    func createData(image: String, name: String, phoneNumber: String) {
        guard let entity = NSEntityDescription.entity(forEntityName: PhoneBook.className, in: self.container.viewContext) else { return }
        let newPhoneBook = NSManagedObject(entity: entity, insertInto: self.container.viewContext)
        newPhoneBook.setValue(name, forKey: PhoneBook.Key.name)
        newPhoneBook.setValue(phoneNumber, forKey: PhoneBook.Key.phoneNumber)
        newPhoneBook.setValue(image, forKey: PhoneBook.Key.image)
        
        do{
            try self.container.viewContext.save()
            print("저장 성공")
        } catch {
            print("저장 실패")
        }
    }
    func readData() {
       do{
           let phoneBooks = try self.container.viewContext.fetch(PhoneBook.fetchRequest())
           
           for phoneBook in phoneBooks as [NSManagedObject] {
               if let name = phoneBook.value(forKey: PhoneBook.Key.name) as? String,
                  let phoneNumber = phoneBook.value(forKey: PhoneBook.Key.phoneNumber)  as? String,
                  let image = phoneBook.value(forKey: PhoneBook.Key.image) as? String {
                   PhoneBookDataManager.dataManager.createDataAarry(image: image, name: name, phoneNumber: phoneNumber)
               }
           }
       } catch {
           print("데이터 읽기 실패")
       }
   }
    func createDataAarry(image: String, name: String, phoneNumber: String) {
        let phoneBookData = PhoneBookData(image: image, name: name, phoneNumber: phoneNumber)
        phoneBookDataArray.append(phoneBookData)
        
        print(phoneBookDataArray.count)
    }
    
    func getPhoneBookData() -> [PhoneBookData] {
        print(#function)
        return phoneBookDataArray
    }
}
