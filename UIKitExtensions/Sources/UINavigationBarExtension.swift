//
//  UINavigationBarExtension.swift
//  UIKitExtensions
//
//  Created by 张鹏 on 2019/6/12.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import Foundation

// MARK: - UINavigationBar的扩展
@objc
public extension UINavigationBar {
    
    /// 分割线
    var separatorView: UIView? {
        
        // 获取`UINavigationBar`背景的View
        guard let backgroundView = subviews.first else {
            return nil
        }
        
        // backgroundView上第一个view就是分割线
        guard let separator = backgroundView.subviews.first, separator.bounds.height <= 0.5 else {
            return nil
        }
        
        return separator
    }
    
    /// 内容的View
    var contentView: UIView? {
        for subview in subviews {
            let typeName = "\(type(of: subview))"
            if typeName.hasSuffix("NavigationBarContentView") {
                return subview
            }
        }
        
        return nil
    }
    
    /// 左边按钮的View
    var leftBarButtonView: UIStackView? {
        return barButtonStackViews?.first
    }
    
    /// 右边按钮的View
    var rightBarButtonView: UIStackView? {
        guard let barButtonStackViews = self.barButtonStackViews, barButtonStackViews.count >= 2 else {
            return nil
        }
        
        return barButtonStackViews[1]
    }
    
    /// 承载按钮的`StackView`
    var barButtonStackViews: [UIStackView]? {
        guard let contentView = self.contentView else {
            return nil
        }
        
        // swiftlint:disable force_cast
        return contentView.subviews.filter { $0 is UIStackView } .map { $0 as! UIStackView }
    }
}
