//
//  ViewController.swift
//  Pokemon-Contact
//
//  Created by 진욱의 Macintosh on 12/8/24.
//

import UIKit
import SnapKit

class FirstViewController: UIViewController {

    private var phoneBookDataArray: [PhoneBookData] = []
    let firstView = FistView()
    
    override func loadView() {
        view = firstView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
        setupNaviBar()
    }
    override func viewWillAppear(_ animated: Bool) {
        //뷰가 나타나기전 데이터 Read
        PhoneBookDataManager.dataManager.readData()
        phoneBookDataArray = PhoneBookDataManager.dataManager.getPhoneBookData()
        firstView.tableView.reloadData()
    }
    
    private func tableViewSetup() {
        firstView.tableView.dataSource = self
        firstView.tableView.delegate = self
        firstView.tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.id)
        firstView.tableView.rowHeight = 80
    }
    
    @objc private func naviBarButtonTapped() {
        let phoneBookVC = PhoneBookViewController()
        
        phoneBookVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(phoneBookVC, animated: true)
        print("네비버튼눌림")
    }
  
}
//네비게이션 바 설정
extension FirstViewController {
    
    private func setupNaviBar() {
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
extension FirstViewController: UITableViewDataSource,UITableViewDelegate  {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.id) as? TableViewCell else {
            return UITableViewCell()
        }
        
        //코어데이터에 저장되어있는 이미지 String(base64Encoded)을 UIimage형태로 다시 변환해서 실제 이미지를 나타냅니다.
        /// 이미지 저장 (PhoneBookViewController에서): UIImage - Data  -  String(base64EncodedString)
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


//#Preview {
//    FirstViewController()
//}
