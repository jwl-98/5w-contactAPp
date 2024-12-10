//
//  DataManager.swift
//  Pokemon-Contact
//
//  Created by 진욱의 Macintosh on 12/10/24.
//

import Foundation

class DataManager {
    var pokeUrl = PokemonUrl()
    //데이터를 가져오는 기능을 하는 함수 선언
    //받아야 할 데이터: 캐릭터 이미지, 이름
    func fetchData<JSON: Decodable>(url: URL, completion: @escaping (JSON?) -> Void){
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
                print(decodeData)
            }else{
                print(url.absoluteString)
                completion(nil)
            }
        }.resume()
    }
    
    func fetchPokemonData() {
        let urlComponets = URLComponents(string: pokeUrl.createUrl())
        
        guard let url = urlComponets?.url else {
            print("잘못된 URL")
            return
        }
        fetchData(url: url) { [weak self] (result: PokemonData?) in
            guard let self, let result else { return }
            
        }
        
    }
}
