//
//  BundleExtension.swift
//  FoundationExtensions
//
//  Created by 张鹏 on 2019/8/8.
//  Copyright © 2019 dancewithpeng@gmail.com All rights reserved.
//

import Foundation


// MARK: - `Bundle`的相关扩展
public extension Bundle {
    
    /// 返回当前`Bundle`的图片资源
    ///
    /// - Parameter named: 图片名称
    /// - Returns: 返回对应的图片
    func image(named: String) -> UIImage? {
        return UIImage(named: named, in: self, compatibleWith: nil)
    }
    
    /// 返回本地化的字符串
    ///
    /// - Parameters:
    ///   - key: 对应的key
    ///   - table: 对应的表(文件)
    /// - Returns: 返回本地化的字符串
    func localizedString(forKey key: String, table: String? = nil) -> String {
        return localizedString(forKey: key, value: nil, table: table)
    }
}
