//
//  ViewController.swift
//  Pokemon-Contact
//
//  Created by 진욱의 Macintosh on 12/8/24.
//

import UIKit

class ViewController: UIViewController {
    let cellView = TableViewCell()
    
    override func loadView() {
        view = cellView.contentView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

