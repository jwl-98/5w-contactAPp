//
//  DetailViewController.swift
//  Pokemon-Contact
//
//  Created by 진욱의 Macintosh on 12/9/24.
//

import UIKit
import CoreData

class PhoneBookViewController: UIViewController {
    let phoneBookView = PhoneBookView()
    let jsonDecoder = JsonDecoder()
    var pokemonURL = PokemonUrl()
    
    override func loadView() {
        view = phoneBookView
        setupNaviBar()
        setupAppTarget()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func createURL() {
        pokemonURL = PokemonUrl()
    }
    //포켓몬 이미지를 가져오는 함수
    private func fetchPokemonData() {
        let urlComponets = URLComponents(string: pokemonURL.createUrl())
        guard let url = urlComponets?.url else {
            print("잘못된 URL")
            return
        }
        jsonDecoder.fetchJsonData(url: url) { [weak self] (result: PokemonDataJson?) in
            guard let self, let result else { return }
            let name = result.name
            let imageUrl = result.sprites.other.officialArtWork.frontDefault
            
            DispatchQueue.main.sync {
                self.phoneBookView.nameTextView.text = name
            }
            guard let image = URL(string: imageUrl) else {
                self.phoneBookView.imageView.image = UIImage(named: "error.png")
                return
            }
            if let data = try? Data(contentsOf: image) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.sync {
                        self.phoneBookView.imageView.image = image
                    }
                }
            }
        }
    }
    //포켓몬 한국이름을 가져오는 함수
    private func fetchPokemonKRName() {
        let urlComponets = URLComponents(string: pokemonURL.getKrNameURL())
        
        guard let url = urlComponets?.url else {
            print("잘못된 URL")
            return
        }
        jsonDecoder.fetchJsonData(url: url) { [weak self] (result: KRNameJson?) in
            guard let self, let result else { return }
            let name = result.names
        }
    }
    
    private func setupAppTarget(){
        phoneBookView.randomButton.addTarget(self, action: #selector(randomButtonTapped), for: .touchUpInside)
    }
    @objc func applyButtonTapped() {
        guard let saveName = phoneBookView.nameTextView.text , let saveNumber = phoneBookView.phoneNumberTextView.text, let saveImage = phoneBookView.imageView.image?.pngData() else {
            errorAlert(title: "에러", message: "데이터를 입력하세요!")
            return
        }
        print(saveImage.description)
        PhoneBookDataManager.dataManager.createData(image: saveImage.base64EncodedString(), name: saveName, phoneNumber: saveNumber)
        saveCompleteAlert(title: "저장완료", message: "저장되었습니다.")
    }
    
    @objc func randomButtonTapped() {
        print("랜덤 버튼툴림")
        createURL()
        fetchPokemonData()
        fetchPokemonKRName()
    }
}

extension PhoneBookViewController {
    //네비게이션바 설정
   private func setupNaviBar() {
        let appearance = UINavigationBarAppearance()
        let rightButton = UIBarButtonItem(title: "적용", style: .plain, target: self, action: #selector(applyButtonTapped))
        navigationItem.rightBarButtonItem = rightButton
        //네비게이션바 텍스트 설정
        appearance.titleTextAttributes =  [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
        title = "연락처 추가"
    }
    //저장완료 알림창
    private func saveCompleteAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default) { action in
            self.navigationController?.popViewController(animated: true)
        })
        self.present(alert, animated: true, completion: nil)
    }
    //에러 알림창
    private func errorAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
}

