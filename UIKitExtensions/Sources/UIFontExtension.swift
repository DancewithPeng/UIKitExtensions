//
//  UIFontExtension.swift
//  UIKitExtensions
//
//  Created by 张鹏 on 2019/4/23.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import Foundation

// MARK: - 返回各种字重的UIFont便捷方法
public extension UIFont {
    
    /// 标准体
    static func regular(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    /// 超轻体
    static func ultraLight(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .ultraLight)
    }
    
    /// 细体
    static func thin(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .thin)
    }
    
    /// 轻体
    static func light(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .light)
    }
    
    /// 中体
    static func medium(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .medium)
    }
    
    /// 半粗体
    static func semibold(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .semibold)
    }
    
    /// 粗体
    static func bold(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .bold)
    }
    
    /// 重体
    static func heavy(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .heavy)
    }
    
    /// 黑体
    static func black(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .black)
    }
}


// MARK: - 返回标准体字重的便捷方法
public extension UIFont {
    
    /// 返回对应字号的系统字体，字重为标准体
    ///
    /// - Parameter size: 对应的字号
    /// - Returns: 返回对应字号的系统字体，字重为标准体
    static func size(_ size: CGFloat) -> UIFont {
        return regular(size: size)
    }
}
