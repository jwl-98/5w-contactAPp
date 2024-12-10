//
//  TableViewCell.swift
//  Pokemon-Contact
//
//  Created by 진욱의 Macintosh on 12/8/24.
//

import UIKit

final class TableViewCell: UITableViewCell {
    static let id = "TableViewCell"
    
    let profileImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.backgroundColor = .white
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        
        return label
    }()
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textAlignment = .right
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        
        [
            profileImage,
            nameLabel,
            phoneLabel
        ].forEach{ contentView.addSubview($0) }
        
        profileImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(50)
            $0.height.equalTo(50)
        }
        nameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.equalTo(100)
            $0.leading.equalTo(profileImage.snp.trailing).offset(10)
        }
        phoneLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(nameLabel.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
    }
    
}


