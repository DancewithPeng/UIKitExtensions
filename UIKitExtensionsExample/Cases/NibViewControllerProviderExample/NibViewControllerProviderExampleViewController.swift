//
//  NibViewControllerProviderExampleViewController.swift
//  UIKitExtensionsExample
//
//  Created by 张鹏 on 2019/8/13.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import UIKit

class NibViewControllerProviderExampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func showViewControllerButtonDidClick(_ sender: Any) {
        if let sameNameViewController = SameNameViewController.makeFromNib() {
            present(sameNameViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func showDiffNibNameViewControllerButtonDidClick(_ sender: Any) {
        if let diffNameViewController = SameNameViewController.makeFromNib("DiffNameViewController") {
            present(diffNameViewController, animated: true, completion: nil)
        }
    }
}
