//
//  UITableViewExtensionController.swift
//  UIKitExtensionsExample
//
//  Created by 张鹏 on 2019/4/24.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import UIKit

class UITableViewExtensionController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // register
        tableView.registerCell(CustomCell.self)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // reuse
        let cell: CustomCell = tableView.dequeueReusableCell(for: indexPath)
        cell.textLabel?.text = "Custom Cell"
        return cell
    }
}

extension UITableViewExtensionController {
    
    class CustomCell: UITableViewCell {
        
    }
}
