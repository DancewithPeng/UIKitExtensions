//
//  UIKitExtensions.swift
//  UIKitExtensions
//
//  Created by DancewithPeng on 2020/7/2.
//  Copyright © 2020 dancewithpeng@gmail.com. All rights reserved.
//

import Foundation

/// 仅用作标识框架的类
class UIKitExtensions {
    static var resourceBundle: Bundle {
        moduleBundle
    }
}

extension UIKitExtensions: ModuleBundleProvider {}
