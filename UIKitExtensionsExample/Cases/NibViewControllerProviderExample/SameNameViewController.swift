//
//  SameNameViewController.swift
//  UIKitExtensionsExample
//
//  Created by 张鹏 on 2019/8/13.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import UIKit

class SameNameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
}
