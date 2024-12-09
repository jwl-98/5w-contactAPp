//
//  ViewController.swift
//  Pokemon-Contact
//
//  Created by 진욱의 Macintosh on 12/8/24.
//

import UIKit
import SnapKit

class ListViewController: UIViewController {
    var dummyArray: [Dummy] = []
    var dummyData = DummyData()
    
    var pokeUrl = PokemonUrl()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        dummyData.makeDummyData()
        dummyArray = dummyData.getDummyDate()
        
    }
    private lazy var uiView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .white
        view.addSubview(label)
        view.addSubview(addButton)
        
        return view
    }()
    private let label: UILabel = {
        let label = UILabel()
        label.text = "친구 목록"
        label.font = .boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("추가", for: .normal)
        button.setTitleColor(UIColor.gray, for: .normal)
        
        return button
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.id)
    
        
        return tableView
    }()
    
    private func configureUI() {
        [
            tableView,
            uiView
        ].forEach{view.addSubview($0)}
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(uiView.snp.bottom).offset(0)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        uiView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(0)
            $0.height.equalTo(80)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        label.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        addButton.snp.makeConstraints {
            $0.centerY.equalTo(label.snp.centerY)
            $0.trailing.equalToSuperview().offset(-20)
        }
    }
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

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.id) as? TableViewCell else {
            return UITableViewCell()
        }
        cell.profileImage.image = dummyArray[indexPath.row].dummyImage
        cell.nameLabel.text = dummyArray[indexPath.row].dummyName
        cell.phoneLabel.text = dummyArray[indexPath.row].dummyPhoneNumber
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyArray.count
    }
    
}
extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}
