//
//  ViewController.swift
//  Pokemon-Contact
//
//  Created by 진욱의 Macintosh on 12/8/24.
//

import UIKit
import SnapKit

class FistViewController: UIViewController {
    var dummyArray: [Dummy] = []
    var dummyData = DummyData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNaviBar()
        configureUI()
        dummyData.makeDummyData()
        dummyArray = dummyData.getDummyDate()
    }

    
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
        ].forEach{view.addSubview($0)}
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
   @objc private func naviBarButtonTapped() {
       let phoneBookVC = PhoneBookViewController()
    
       phoneBookVC.modalPresentationStyle = .fullScreen
       //self.present(phoneBookVC, animated: true, completion: nil)
       navigationController?.pushViewController(phoneBookVC, animated: true)
       print("네비버튼눌림")
    }
}
//네비게이션 바 설정
extension FistViewController {
    func setupNaviBar() {
        let appearance = UINavigationBarAppearance()
        let button = UIBarButtonItem(title: "추가", style: .plain, target: self, action: #selector(naviBarButtonTapped))
        navigationItem.rightBarButtonItem = button
        button.tintColor = .darkGray
        appearance.configureWithOpaqueBackground()
        appearance.titleTextAttributes =  [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
        appearance.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        title = "친구목록"
    }
    
}
extension FistViewController: UITableViewDataSource {
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
extension FistViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}

//#Preview {
//    ListViewController()
//}
