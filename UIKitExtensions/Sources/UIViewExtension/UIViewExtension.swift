//
//  UIViewExtension.swift
//  UIKitExtensions
//
//  Created by 张鹏 on 2019/5/10.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import Foundation
import DPFoundationExtensions

// MARK: - Safe Area
@objc
public extension UIView {
    
    /// 安全区域指南
    var compatibleSafeAreaLayoutGuide: UILayoutGuide {
        
        // iOS11 之后的版本直接使用`safeAreaLayoutGuide`
        if #available(iOS 11, *) {
            return safeAreaLayoutGuide
        } else {
            
            // iOS11 之前的版本使用自定义的UILayoutGuide
            
            // 如果是View Controller的view，则使用CompatibleSafeAreaLayoutGuide
            if ownerViewController != nil {
                
                if let index = layoutGuides.firstIndex(where: { $0.identifier == "CompatibleSafeAreaLayoutGuide" }) {
                    return layoutGuides[index]
                }
                
                let viewControllerSafeAreaLayoutGuide = CompatibleSafeAreaLayoutGuide()
                addLayoutGuide(viewControllerSafeAreaLayoutGuide)
                return viewControllerSafeAreaLayoutGuide
            } else {
                // 否则使用PlaceholderLayoutGuide
                if let index = layoutGuides.firstIndex(where: { $0.identifier == "PlaceholderLayoutGuide" }) {
                    return layoutGuides[index]
                }
                
                let fullLayoutGuide = PlaceholderLayoutGuide()
                addLayoutGuide(fullLayoutGuide)
                return fullLayoutGuide
            }
        }
    }
    
    /// 安全区域边距
    var compatibleSafeAreaInsets: UIEdgeInsets {
        
        if #available(iOS 11, *) {
            return safeAreaInsets
        } else {
            
            if let ownerVC = ownerViewController {
                return UIEdgeInsets(top: ownerVC.topLayoutGuide.length, left: 0, bottom: ownerVC.bottomLayoutGuide.length, right: 0)
            }
            
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
}


// MARK: - Owner View Controller
@objc
public extension UIView {
    
    /// 持有View的UIViewController，如果 UIViewController.view != self 则会返回nil
    var ownerViewController: UIViewController? {
        if let ownerVC = next as? UIViewController, ownerVC.view == self {
            return ownerVC
        }
        return nil
    }
}


// MARK: - Recursive Traversal Subviews
@objc
public extension UIView {
    
    /// 递归遍历子View
    ///
    /// - Parameter handler: 处理器
    func recursiveTraversalSubviews(using handler: (UIView) -> Void) {
        
        handler(self)
        
        for subview in subviews {
            subview.recursiveTraversalSubviews(using: handler)
        }
    }
}


// MARK: - UIView isVisible
@objc
public extension UIView {
    
    var isVisible: Bool {
        if self is UIWindow {
            return true
        }
        
        if alpha > 0 {
            return true
        }
        
        return false
    }
}



// MARK: - NibViewProvider

/// `XIB`View的提供商
public protocol NibViewProvider: BundleProvider {
    
    /// 根据`XIB`创建一个View
    ///
    /// - Parameter nibName: `XIB`文件名
    /// - Returns: 返回`XIB`对应的View
    static func makeFromNib(_ nibName: String?) -> Self?
}

// MARK: - `NibViewProvider`默认实现
public extension NibViewProvider {
    
    /// 根据`XIB`创建一个View
    ///
    /// - Parameter nibName: `XIB`文件名
    /// - Returns: 返回`XIB`对应的View
    static func makeFromNib(_ nibName: String? = nil) -> Self? {
        guard let view = currentBundle.loadNibNamed(nibName ?? "\(self)", owner: nil, options: nil)?.first as? Self else {
            return nil
        }
        
        return view
    }
}

// MARK: - 让`UIView`实现`NibViewProvider`
extension UIView: NibViewProvider {}
