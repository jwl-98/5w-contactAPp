//
//  DetailViewController.swift
//  Pokemon-Contact
//
//  Created by 진욱의 Macintosh on 12/9/24.
//

import UIKit

class PhoneBookViewController: UIViewController {
    let phoneBookView = PhoneBookView()
    let dataManager = DataManager()
    var pokemonURL = PokemonUrl()
    
    override func loadView() {
        view = phoneBookView
        setupNaviBar()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppTarget()
        // Do any additional setup after loading the view.
    }
    
    
    func setupAppTarget(){
        phoneBookView.randomButton.addTarget(self, action: #selector(randomButtonTapped), for: .touchUpInside)
    }
    
    @objc func applyButtonTapped() {
        print("적용버튼 눌림")
    }
    @objc func randomButtonTapped() {
        print("랜덤 버튼툴림")
        createURL()
        fetchPokemonData()
        fetchPokemonKRName()
    }

}

extension PhoneBookViewController {
    
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
        dataManager.fetchData(url: url) { [weak self] (result: PokemonDataJson?) in
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
        dataManager.fetchData(url: url) { [weak self] (result: KRNameJson?) in
            guard let self, let result else { return }
            let name = result.names
            print(name)
        }
    }
}
extension PhoneBookViewController {
    //네비게이션바 설정
    func setupNaviBar() {
        let appearance = UINavigationBarAppearance()
        let rightButton = UIBarButtonItem(title: "적용", style: .plain, target: self, action: #selector(applyButtonTapped))
        navigationItem.rightBarButtonItem = rightButton
        appearance.configureWithOpaqueBackground()
        appearance.titleTextAttributes =  [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
        appearance.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        title = "연락처 추가"
    }
}
