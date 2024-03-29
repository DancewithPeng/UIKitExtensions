//
//  ExtendedViewController.swift
//  UIKitExtensions
//
//  Created by DancewithPeng on 2019/4/25.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import UIKit

/// 扩展的ViewController基类，封装了常用的方法
@objc
open class ExtendedViewController: UIViewController {

    /// 控制是否隐藏导航栏
    open var hidesNavigationBar = false
    
    /// 控制是否隐藏导航栏分割线
    open var hidesNavigationBarSeparator = false
    
    /// 导航栏分割线图片
    open var navigationBarSeparatorImage: UIImage?
    
    /// 控制是否让导航栏透明
    open var transparentNavigationBar = false
    
    /// 是否启用返回按钮
    open var enableBackBarButtonItem = true
    
    /// 是否启用交互返回手势
    open var enableInteractivePopGesture = true
    
    /// 自定返回按钮的点击处理
    open var backBarButtonItemTapHanding: ((ExtendedViewController) -> Void)?
    
    /// 返回手势结束处理
    open var popGestureDidEndHanding: ((ExtendedViewController) -> Void)?
    
    /// 销毁处理
    open var deinitHanding: ((ExtendedViewController) -> Void)?
    
    
    // MARK: - Life Cycle Methods
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        hidesBottomBarWhenPushed = true
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        hidesBottomBarWhenPushed = true
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 隐藏导航栏
        if hidesNavigationBar {
            navigationController?.setNavigationBarHidden(true, animated: animated)
            return
        }
        
        // 显示导航栏
        navigationController?.setNavigationBarHidden(false, animated: animated)
        
                                
        // 让导航栏透明
        if transparentNavigationBar {
            if #available(iOS 13, *) {
                let navigationBarAppearanceTransparentAction: (UINavigationBarAppearance) -> Void = { barAppearance in
                    barAppearance.configureWithTransparentBackground()
                }
                setupNavigationBarStandardAppearance(with: navigationBarAppearanceTransparentAction)
                setupNavigationBarScrollEdgeAppearance(with: navigationBarAppearanceTransparentAction)
            } else {
                let transparentImage = UIImage()
                navigationController?.navigationBar.setBackgroundImage(transparentImage, for: .default)
                navigationController?.navigationBar.shadowImage = transparentImage
                
                // 显示导航栏
                navigationController?.setNavigationBarHidden(false, animated: animated)
            }
            return
        }
        
        // 导航栏不透明
        if #available(iOS 13, *) {
            let navigationBarAppearanceTransparentAction: (UINavigationBarAppearance) -> Void = { barAppearance in
                barAppearance.configureWithDefaultBackground()
            }
            setupNavigationBarStandardAppearance(with: navigationBarAppearanceTransparentAction)
            setupNavigationBarScrollEdgeAppearance(with: navigationBarAppearanceTransparentAction)
        } else {
            navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        }
               
        // 隐藏导航栏分割线
        if hidesNavigationBarSeparator {
            if #available(iOS 13, *) {
                let navigationBarAppearanceTransparentAction: (UINavigationBarAppearance) -> Void = { barAppearance in
                    barAppearance.shadowImage = UIImage()
                    barAppearance.shadowColor = nil
                }
                setupNavigationBarStandardAppearance(with: navigationBarAppearanceTransparentAction)
                setupNavigationBarScrollEdgeAppearance(with: navigationBarAppearanceTransparentAction)
            } else {
                if navigationController?.navigationBar.separatorView != nil {
                    navigationController?.navigationBar.separatorView?.isHidden = true
                } else {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
                        self?.navigationController?.navigationBar.separatorView?.isHidden = true
                    }
                }
                navigationController?.navigationBar.shadowImage = UIImage()
            }
            return
        }
        
        // 显示导航栏分割线
        
        if #available(iOS 13, *) {
            let navigationBarAppearanceTransparentAction: (UINavigationBarAppearance) -> Void = { barAppearance in
                barAppearance.shadowImage = nil
                barAppearance.shadowColor = nil
            }
            setupNavigationBarStandardAppearance(with: navigationBarAppearanceTransparentAction)
            setupNavigationBarScrollEdgeAppearance(with: navigationBarAppearanceTransparentAction)
        } else {
            navigationController?.navigationBar.separatorView?.isHidden = false
            navigationController?.navigationBar.shadowImage = navigationBarSeparatorImage
        }
    }
    
    deinit {
        deinitHanding?(self)
    }
    
    
    // MARK: - Event Handing
    
    /// 页面返回按钮倍点击
    ///
    /// - Parameter sender: 事件触发者
    @objc
    open func backBarButtonItemDidClick(_ sender: Any?) {
        if backBarButtonItemTapHanding == nil {
            navigationController?.popViewController(animated: true)
        } else {
            backBarButtonItemTapHanding?(self)
        }
    }
    
    
    // MARK: - Style
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

// MARK: - Helper Methods

extension ExtendedViewController {
    
    @available(iOS 13, *)
    private func setupNavigationBarStandardAppearance(with action: (UINavigationBarAppearance) -> Void) {
        
        guard let navigationController = self.navigationController else {
            return
        }
        
        let standardAppearance = navigationController.navigationBar.standardAppearance
        action(standardAppearance)
        navigationController.navigationBar.standardAppearance = standardAppearance
    }
    
    @available(iOS 13, *)
    private func setupNavigationBarScrollEdgeAppearance(with action: (UINavigationBarAppearance) -> Void) {
        
        guard let navigationController = self.navigationController else {
            return
        }
        
        let scrollEdgeAppearance: UINavigationBarAppearance
        if let originalScrollEdgeAppearance = navigationController.navigationBar.scrollEdgeAppearance {
            scrollEdgeAppearance = originalScrollEdgeAppearance
        } else {
            scrollEdgeAppearance = UINavigationBarAppearance()
        }
                 
        action(scrollEdgeAppearance)
        navigationController.navigationBar.scrollEdgeAppearance = scrollEdgeAppearance
    }
    
    private func setupNavigationBarHidden(_ isHidden: Bool, animated: Bool) {
        
    }
}
