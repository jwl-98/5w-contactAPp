//
//  TableViewCell.swift
//  Pokemon-Contact
//
//  Created by 진욱의 Macintosh on 12/8/24.
//

import UIKit

class TableViewCell: UITableViewCell {
    static let id = "listTableViewCell"

    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .green
        imageView.tintColor = .black
        imageView.layer.cornerRadius = imageView.frame.width / 2
        
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .blue
        label.text = "dddddd"

        return label
    }()
    
    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        label.textAlignment = .right
        label.text = "010-0000-0000"
        
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        contentView.backgroundColor = .white
        
        [
            profileImage,
            nameLabel,
            phoneLabel
        ].forEach{ contentView.addSubview($0) }
        
        profileImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
//            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.width.height.equalTo(60)
        }
        nameLabel.snp.makeConstraints {
            $0.centerX.equalTo(profileImage.snp.centerX)
            $0.width.equalTo(100)
            $0.leading.equalTo(profileImage.snp.trailing).offset(10)
        }
        phoneLabel.snp.makeConstraints {
            $0.centerX.equalTo(profileImage.snp.centerX)
            $0.leading.equalTo(nameLabel.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
    }
}
//#Preview {
//    ViewController()
//}
