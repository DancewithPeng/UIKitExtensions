//
//  BundleProvider.swift
//  FoundationExtensions
//
//  Created by 张鹏 on 2019/8/8.
//  Copyright © 2019 dancewithpeng@gmail.com All rights reserved.
//

import Foundation


/// `Bundle`提供商
public protocol BundleProvider: AnyObject {
    
    /// 当前`Bundle`
    var currentBundle: Bundle { get }
    
    /// 当前`Bundle`
    static var currentBundle: Bundle { get }
}

// MARK: - `BundleProvider`默认实现
public extension BundleProvider {
    
    var currentBundle: Bundle {
        return Bundle(for: type(of: self))
    }
    
    static var currentBundle: Bundle {
        return Bundle(for: self)
    }
}

// MARK: - 让NSObject的字类都实现`BundleProvider`
extension NSObject: BundleProvider {}
