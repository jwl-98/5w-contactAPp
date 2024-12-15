//
//  ViewController.swift
//  Pokemon-Contact
//
//  Created by 진욱의 Macintosh on 12/15/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let firstVC = FirstViewController()
        let naviController = UINavigationController(rootViewController: firstVC)
        setup(child: naviController)
        
    }
    private func setup(child: UIViewController) {
        addChild(child)
        [
            child.view
        ].forEach{self.view.addSubview($0)}
        
        child.view.snp.makeConstraints {
            
            $0.leading.equalTo(self.view)
            $0.trailing.equalTo(self.view)
            $0.top.equalTo(self.view)
            $0.bottom.equalTo(self.view)
        }
    }
}

