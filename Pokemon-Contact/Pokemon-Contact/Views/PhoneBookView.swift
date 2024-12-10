//
//  DetailView.swift
//  Pokemon-Contact
//
//  Created by 진욱의 Macintosh on 12/9/24.
//

import UIKit

class PhoneBookView: UIView {
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
    
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.layer.cornerRadius = 100
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    var randomButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("랜덤 이미지 생성", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.setTitleColor(UIColor.gray, for: .normal)
        
        return button
    }()
    private var textViewStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        
        return stackView
    }()
    var nameTextView: UITextView = {
        let textView = UITextView()
        
        textView.font = .systemFont(ofSize: 20)
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 10
        textView.clipsToBounds = true
        return textView
    }()
    
    let phoneNumberTextView: UITextView = {
        let textView = UITextView()
        
        textView.font = .systemFont(ofSize: 20)
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 10
        textView.clipsToBounds = true
        textView.keyboardType = .numberPad
        return textView
    }()
    
    private func configureUI() {
        [
            imageView,
            randomButton,
            textViewStackView
        ].forEach { self.addSubview($0) }
        
        [
            nameTextView,
            phoneNumberTextView
        ].forEach{ textViewStackView.addArrangedSubview($0) }
        
        imageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(30)
            $0.width.height.equalTo(200)
        }
        
        randomButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(imageView.snp.bottom).offset(20)
            $0.height.equalTo(20)
        }
        
        textViewStackView.snp.makeConstraints {
            $0.top.equalTo(randomButton.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(80)
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
//#Preview {
//    PhoneBookViewController()
//}

