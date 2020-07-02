//
//  UISearchBarExtensionViewController.swift
//  UIKitExtensionsExample
//
//  Created by 张鹏 on 2019/6/11.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import UIKit
import UIKitExtensions
import DPLog

class UISearchBarExtensionViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.searchField?.textColor = UIColor.red
        searchBar.showsCancelButton = true
        searchBar.cancelButton?.setTitle("自定义取消按钮", for: .normal)
    }
}
