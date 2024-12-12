//
//  ViewController.swift
//  Pokemon-Contact
//
//  Created by 진욱의 Macintosh on 12/8/24.
//

import UIKit
import SnapKit

class FistViewController: UIViewController {
    private var phoneBookDataArray: [PhoneBookData] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        setupNaviBar()
        configureUI()
        PhoneBookDataManager.dataManager.readData()
    }
    override func viewWillAppear(_ animated: Bool) {
        print(#function)
        tableView.reloadData()
        phoneBookDataArray = PhoneBookDataManager.dataManager.getPhoneBookData()
        print("배열갯수: \(phoneBookDataArray.count)")
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
        //코어데이터에 저장되어있는 이미지 String(base64Encoded)을 UIimage형태로 다시 변환해서 실제 이미지를 나타냅니다.
        /// 흐름:  이미지 저장 : UIImage - Data  -  String(base64EncodedString)
        ///이미지 출력: String(base64EncodedString) - Data - UIImage
        cell.profileImage.image = UIImage(data: Data(base64Encoded: phoneBookDataArray[indexPath.row].image)!)
        cell.nameLabel.text = phoneBookDataArray[indexPath.row].name
        cell.phoneLabel.text = phoneBookDataArray[indexPath.row].phoneNumber
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return phoneBookDataArray.count
    }
    
}
extension FistViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}
