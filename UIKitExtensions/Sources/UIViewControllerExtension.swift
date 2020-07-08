//
//  UIViewControllerExtension.swift
//  UIKitExtensions
//
//  Created by 张鹏 on 2019/4/15.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import UIKit
import DPFoundationExtensions

// MARK: - Child View Controller
public extension UIViewController {
    
    /// 子控制器布局方式
    enum ChildControllerLayout {
        case consistentWithParent
        case frame(frame: CGRect)
    }
    
    /// 添加子视图控制器，并指定子控制器的布局方式
    ///
    /// - Parameters:
    ///   - childController: 子控制器
    ///   - layout: 子控制器布局
    func addChild(_ childController: UIViewController, layout: ChildControllerLayout) {
        
        addChild(childController)
        view.addSubview(childController.view)
        
        switch layout {
        case .consistentWithParent:
            childController.view.translatesAutoresizingMaskIntoConstraints = false
            childController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            childController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            childController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            childController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        case let .frame(frame):
            childController.view.frame = frame
        }
        
        childController.didMove(toParent: self)
    }
    
    /// 移除子视图控制器
    ///
    /// - Parameter childController: 子视图控制器
    func removeChild(_ childController: UIViewController) {
        childController.willMove(toParent: nil)
        childController.view.removeFromSuperview()
        childController.removeFromParent()
    }
}


// MARK: - Visible View Controller
@objc
public extension UIViewController {
    
    /// 当前可见的的视图控制器
    var currentVisibleViewController: UIViewController? {
        return UIApplication.visibleViewController
    }
    
    /// 获取可见的视图控制器
    ///
    /// - Returns: 返回当前可见的视图控制器
    fileprivate func fetchVisibleViewController() -> UIViewController? {
        
        if let presentedVC = presentedViewController {
            return presentedVC.fetchVisibleViewController()
        }
        
        if let nav = self as? UINavigationController {
            
            if let navVisibleVC = nav.visibleViewController {
                return navVisibleVC.fetchVisibleViewController()
            } else {
                return nav
            }
        }
        
        if let tab = self as? UITabBarController {
            if let tabVCs = tab.viewControllers, tabVCs.count > 0 {
                return tab.selectedViewController?.fetchVisibleViewController()
            } else {
                return tab
            }
        }
        
        if children.count > 0 {
            return children.last?.fetchVisibleViewController()
        }
        
        if view.isVisible {
            return self
        }
        
        return nil
    }
}


// MARK: - UIApplication Visible ViewController
@objc
public extension UIApplication {
    
    static var visibleViewController: UIViewController? {
        guard let rootViewController = shared.keyWindow?.rootViewController else {
            return nil
        }
        
        return rootViewController.fetchVisibleViewController()
    }
}


// MARK: - NibViewControllerProvider

/// `XIB`ViewController的提供商
public protocol NibViewControllerProvider: BundleProvider {
    
    /// ViewController的类型
    static var viewControllerType: UIViewController.Type { get }
    
    /// 根据`XIB`创建一个ViewController
    ///
    /// - Parameter nibName: `XIB`文件名
    /// - Returns: 返回`XIB`对应的ViewController
    static func makeFromNib(_ nibName: String?) -> Self?
}

// MARK: - `NibViewControllerProvider`默认实现
public extension NibViewControllerProvider {
    
    /// ViewController的类型
    static var viewControllerType: UIViewController.Type {
        guard let type = self as? UIViewController.Type else {
            return UIViewController.self
        }
        
        return type
    }
    
    /// 根据`XIB`创建一个ViewController
    ///
    /// - Parameter nibName: `XIB`文件名
    /// - Returns: 返回`XIB`对应的ViewController
    static func makeFromNib(_ nibName: String? = nil) -> Self? {
        
        guard let viewController = viewControllerType.init(nibName: nibName ?? "\(viewControllerType)", bundle: currentBundle) as? Self else {
            return nil
        }
        
        return viewController
    }
}

// MARK: - 让`UIView`实现`NibViewProvider`
extension UIViewController: NibViewControllerProvider {}
