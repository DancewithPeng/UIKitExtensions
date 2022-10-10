//
//  NSAttributedStringExtension.swift
//  UIKitExtensions
//
//  Created by DancewithPeng on 2020/7/2.
//  Copyright © 2020 dancewithpeng@gmail.com. All rights reserved.
//

import Foundation

/// NSAttributedString的扩展
public extension NSAttributedString {
    
    /// 创建带有行高的富文本
    /// - Parameters:
    ///   - string: 字符串
    ///   - font: 字体
    ///   - color: 颜色
    ///   - lineHeight: 行高
    convenience init(string: String, font: UIFont? = nil, color: UIColor? = nil, minimumLineHeight: CGFloat? = nil) {
        
        var attributes: [NSAttributedString.Key: Any] = [:]
        
        if let textFont = font {
            attributes[NSAttributedString.Key.font] = textFont
        }
        
        if let textColor = color {
            attributes[NSAttributedString.Key.foregroundColor] = textColor
        }
        
        if let textMinimumLineHeight = minimumLineHeight {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = textMinimumLineHeight - (font?.lineHeight ?? 0)
            
            attributes[NSAttributedString.Key.paragraphStyle] = paragraphStyle
        }
        
        self.init(string: string, attributes:attributes)
    }
}

/// 从String直接创建NSAttributedString的便捷方法
public extension String {
    
    /// 创建NSAttributedString的便捷方法
    /// - Parameter attributes: 属性
    /// - Returns: 返回对应的NSAttributedString对象
    func attributedString(_ attributes: [NSAttributedString.Key: Any]) -> NSAttributedString {
        return NSAttributedString(string: self, attributes: attributes)
    }
    
    /// 创建NSAttributedString的便捷方法
    /// - Parameters:
    ///   - font: 字体
    ///   - color: 颜色
    ///   - minimumLineHeight: 最小行高
    /// - Returns: 返回对应的NSAttributedString对象
    func attributedString(font: UIFont? = nil, color: UIColor? = nil, minimumLineHeight: CGFloat? = nil) -> NSAttributedString {
        return NSAttributedString(string: self, font: font, color: color, minimumLineHeight: minimumLineHeight)
    }
}
