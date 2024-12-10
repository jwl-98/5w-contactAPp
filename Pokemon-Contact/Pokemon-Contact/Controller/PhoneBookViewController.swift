//
//  DetailViewController.swift
//  Pokemon-Contact
//
//  Created by 진욱의 Macintosh on 12/9/24.
//

import UIKit

class PhoneBookViewController: UIViewController {
    let phoneBookView = PhoneBookView()
    
    override func loadView() {
        view = phoneBookView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppTarget()
        // Do any additional setup after loading the view.
    }

    
    func setupAppTarget(){
        phoneBookView.randomButton.addTarget(self, action: #selector(randomButtonTapped), for: .touchUpInside)
    }
    
    @objc func randomButtonTapped() {
        print("버튼툴림")
    }
}
