//
//  UIApplicationExtensionViewController.swift
//  UIKitExtensionsExample
//
//  Created by DancewithPeng on 2019/4/27.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import UIKit

class UIApplicationExtensionViewController: UIViewController {

    @IBOutlet weak var bundleIDLabel: UILabel!
    @IBOutlet weak var bundleDisplayNameLabel: UILabel!
    @IBOutlet weak var bundleVersionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bundleIDLabel.text = "Bundle ID: \(UIApplication.shared.bundleIdentifier)"
        bundleDisplayNameLabel.text = "Bundle Display Name：\(UIApplication.shared.bundleDisplayName)"
        bundleVersionLabel.text = "Bundle Version：\(UIApplication.shared.bundleVersion)"            
    }
}
