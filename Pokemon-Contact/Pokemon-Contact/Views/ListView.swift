//
//  ListView.swift
//  Pokemon-Contact
//
//  Created by 진욱의 Macintosh on 12/8/24.
//

import UIKit
import SnapKit

class ListView: UIView {
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "친구 목록"
        
        return label
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    
    
    
}
