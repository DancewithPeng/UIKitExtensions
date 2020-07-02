//
//  LocalizableExtension.swift
//  FoundationExtensions
//
//  Created by 张鹏 on 2019/8/8.
//  Copyright © 2019 dancewithpeng@gmail.com All rights reserved.
//

import Foundation


/// 本地化提供商
public protocol LocalizableProvider: BundleProvider {
    
    /// 本地化字符串
    ///
    /// - Parameters:
    ///   - string: 需要本地化的字符串
    ///   - table: 对应的表(文件)
    /// - Returns: 返回本地化的字符串
    func localized(_ string: String, in table: String?) -> String
    
    /// 本地化字符串
    ///
    /// - Parameters:
    ///   - string: 需要本地化的字符串
    ///   - table: 对应的表(文件)
    /// - Returns: 返回本地化的字符串
    static func localized(_ string: String, in table: String?) -> String
}

// MARK: - `LocalizableProvider`默认实现
public extension LocalizableProvider {
    
    func localized(_ string: String, in table: String? = nil) -> String {
        return currentBundle.localizedString(forKey: string, table: table)
    }
    
    static func localized(_ string: String, in table: String? = nil) -> String {
        return currentBundle.localizedString(forKey: string, table: table)
    }
}

// MARK: - 让`NSObject`实现`LocalizableProvider`
extension NSObject: LocalizableProvider {}
