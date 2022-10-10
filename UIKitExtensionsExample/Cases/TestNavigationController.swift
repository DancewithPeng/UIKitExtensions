//
//  TestNavigationController.swift
//  UIKitExtensionsExample
//
//  Created by DancewithPeng on 2019/4/25.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import UIKit

class TestNavigationController: UINavigationController {
    
    override var childForStatusBarStyle: UIViewController? {
        return visibleViewController
    }
}
