//
//  UIFontExtensionController.swift
//  UIKitExtensionsExample
//
//  Created by 张鹏 on 2019/4/24.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import UIKit

class UIFontExtensionController: UITableViewController {
    
    lazy var fonts = [(UIFont.regular(size: 30), "regular"),
                      (UIFont.ultraLight(size: 30), "ultraLight"),
                      (UIFont.thin(size: 30), "thin"),
                      (UIFont.light(size: 30), "light"),
                      (UIFont.medium(size: 30), "medium"),
                      (UIFont.semibold(size: 30), "semibold"),
                      (UIFont.bold(size: 30), "bold"),
                      (UIFont.heavy(size: 30), "heavy"),
                      (UIFont.black(size: 30), "black"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerCell(UITableViewCell.self)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fonts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(for: indexPath)
        let (font, weight) = fonts[indexPath.row]
        cell.textLabel?.text = weight
        cell.textLabel?.font = font
        return cell
    }
}
