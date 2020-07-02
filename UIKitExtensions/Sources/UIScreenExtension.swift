//
//  UIScreenExtension.swift
//  UIKitExtensions
//
//  Created by 张鹏 on 2019/4/26.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import Foundation

// MARK: - UIScreen相关扩展
public extension UIScreen {
    
    /// 是否有缺口(刘海屏)
    var hasNotch: Bool {
        
        if let notched = objc_getAssociatedObject(self, &UIScreen.hasNotchAssociatedObjectKey) as? Bool {
            return notched
        }
        
        let notched = UIScreen.notchScreenDevices.contains(UIDevice.current.modelIdentifier)
        objc_setAssociatedObject(self, &UIScreen.hasNotchAssociatedObjectKey, notched, .OBJC_ASSOCIATION_ASSIGN)
        
        return notched
    }
}

// MARK: - Constants
private extension UIScreen {
    
    /// 缺口屏的设备
    static let notchScreenDevices = [
        "iPhone10,3",
        "iPhone10,6",
        "iPhone11,2",
        "iPhone11,4",
        "iPhone11,6",
        "iPhone11,8",
        "iPhone12,1",
        "iPhone12,3",
        "iPhone12,5"
    ]
    
    /// 判定屏幕是否有缺口的关联对象的key
    static var hasNotchAssociatedObjectKey = "UIScreen.hasNotchAssociatedObjectKey"
}
