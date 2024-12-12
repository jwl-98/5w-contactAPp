//
//  DummyData.swift
//  Pokemon-Contact
//
//  Created by 진욱의 Macintosh on 12/9/24.
//

import UIKit

struct Dummy {
    var dummyImage: UIImage?
    var dummyName: String
    var dummyPhoneNumber: String
}
struct DummyData {
    private var dummyDataArray: [Dummy] = []
    
    mutating func makeDummyData() {
        dummyDataArray = [
            Dummy(dummyImage: UIImage(named: "1.png"), dummyName: "피카츄", dummyPhoneNumber: "010-0000-0001"),
            Dummy(dummyImage: UIImage(named: "2.png"), dummyName: "파이로", dummyPhoneNumber: "010-0020-0002"),
            Dummy(dummyImage: UIImage(named: "3-1.png"), dummyName: "누구냐?", dummyPhoneNumber: "010-0000-0003")
        ]
    }
    func getDummyDate() -> [Dummy] {
        return dummyDataArray
    }
}
