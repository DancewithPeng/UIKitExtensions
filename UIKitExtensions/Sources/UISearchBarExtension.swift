//
//  UISearchBarExtension.swift
//  UIKitExtensions
//
//  Created by 张鹏 on 2019/6/11.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import Foundation

// MARK: - 搜索栏相关扩展
public extension UISearchBar {
    
    /// 搜索输入框
    var searchField: UITextField? {
        
        guard let contView = contentView else {
            return nil
        }
        
        if #available(iOS 13, *) {
            guard let containerView = contentView?.subviews.last else {
                return nil
            }
            
            for subview in containerView.subviews where subview is UITextField {
                return subview as? UITextField
            }
        } else {
            for subview in contView.subviews where subview is UITextField {
                return subview as? UITextField
            }
        }
        
        return nil
    }
    
    /// 取消按钮
    var cancelButton: UIButton? {
        guard let contView = contentView else {
            return nil
        }
                
        if #available(iOS 13, *) {
            guard let containerView = contentView?.subviews.last else {
                return nil
            }
            
            for subview in containerView.subviews where subview is UIButton {
                return subview as? UIButton
            }
        } else {
            for subview in contView.subviews where subview is UIButton {
                return subview as? UIButton
            }
        }
        
        return nil
    }
    
    /// 内容的View
    private var contentView: UIView? {
        return subviews.first
    }
}
