//
//  DataManager.swift
//  Pokemon-Contact
//
//  Created by 진욱의 Macintosh on 12/10/24.
//

import Foundation

class JsonDecoder {
    
    //json디코딩 함수
    func fetchJsonData<JSON: Decodable>(url: URL, completion: @escaping (JSON?) -> Void){
        let session = URLSession(configuration: .default)
        session.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data, error == nil else {
                print("데이터 로드 실패")
                completion(nil)
                return
            }
            let sucessRange = 200..<300
            if let response = response as? HTTPURLResponse, sucessRange.contains(response.statusCode) {
                guard let decodeData = try? JSONDecoder().decode(JSON.self, from: data) else {
                    print("JSON데이터 디코딩 실패")
                    completion(nil)
                    return
                }
                completion(decodeData)
            }else{
                print(url.absoluteString)
                completion(nil)
            }
        }.resume()
    }
}
