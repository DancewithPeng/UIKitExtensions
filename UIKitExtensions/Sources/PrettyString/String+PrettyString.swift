//
//  String+PrettyString.swift
//  UIKitExtensions
//
//  Created by 张鹏 on 2023/3/6.
//  Copyright © 2023 dancewithpeng@gmail.com. All rights reserved.
//

import Foundation

extension String {
    
    /// 构建漂亮字符串
    /// - Parameters:
    ///   - content: 内容字符串
    ///   - font: 字体
    ///   - lineHeight: 行高
    ///   - color: 颜色
    ///   - alignment: 对齐方式
    /// - Returns: 返回对应的富文本字符串
    public func makePrettyString(
        font: UIFont,
        lineHeight: CGFloat,
        color: UIColor? = nil,
        alignment: NSTextAlignment? = nil
    ) -> NSAttributedString {
        let style = PrettyString.Style(font: font,
                                       color: color,
                                       alignment: alignment,
                                       lineHeight: lineHeight)
        return PrettyString(content: self, style: style).makeAttributedString()
    }
    
    /// 构建漂亮字符串
    /// - Parameters:
    ///   - content: 内容字符串
    ///   - font: 字体
    ///   - lineSpacing: 行间距
    ///   - color: 颜色
    ///   - alignment: 对齐方式
    /// - Returns: 返回对应的富文本字符串
    public func makePrettyString(
        font: UIFont,
        lineSpacing: CGFloat,
        color: UIColor? = nil,
        alignment: NSTextAlignment? = nil
    ) -> NSAttributedString {
        let style = PrettyString.Style(font: font,
                                       color: color,
                                       alignment: alignment,
                                       lineSpacing: lineSpacing)
        return PrettyString(content: self, style: style).makeAttributedString()
    }
}

// MARK: - Objc Special

extension NSString {
    
    @objc(makePrettyStringWithFont:lineHeight:color:alignment:)
    /// 构建漂亮字符串
    /// - Parameters:
    ///   - font: 字体
    ///   - lineHeight: 行高
    ///   - color: 颜色
    ///   - alignment: 对齐方式
    /// - Returns: 返回对应的富文本字符串
    public func ___objc_makePrettyString(
        font: UIFont,
        lineHeight: CGFloat,
        color: UIColor?,
        alignment: NSTextAlignment
    ) -> NSAttributedString {
        return (self as String).makePrettyString(font: font,
                                                 lineHeight: lineHeight,
                                                 color: color,
                                                 alignment: alignment)
    }
    
    @objc(makePrettyStringWithFont:lineHeight:color:)
    /// 构建漂亮字符串
    /// - Parameters:
    ///   - font: 字体
    ///   - lineHeight: 行高
    ///   - color: 颜色
    /// - Returns: 返回对应的富文本字符串
    public func ___objc_makePrettyString(
        font: UIFont,
        lineHeight: CGFloat,
        color: UIColor?
    ) -> NSAttributedString {
        return (self as String).makePrettyString(font: font,
                                                 lineHeight: lineHeight,
                                                 color: color,
                                                 alignment: nil)
    }
    
    @objc(makePrettyStringWithFont:lineHeight:)
    /// 构建漂亮字符串
    /// - Parameters:
    ///   - content: 内容字符串
    ///   - font: 字体
    ///   - lineHeight: 行高
    /// - Returns: 返回对应的富文本字符串
    public func ___objc_makePrettyString(
        font: UIFont,
        lineHeight: CGFloat
    ) -> NSAttributedString {
        return (self as String).makePrettyString(font: font,
                                                 lineHeight: lineHeight,
                                                 color: nil,
                                                 alignment: nil)
    }
    
    @objc(makePrettyStringWithFont:lineSpacing:color:alignment:)
    /// 构建漂亮字符串
    /// - Parameters:
    ///   - font: 字体
    ///   - lineSpacing: 行间距
    ///   - color: 颜色
    ///   - alignment: 对齐方式
    /// - Returns: 返回对应的富文本字符串
    public func ___objc_makePrettyString(
        font: UIFont,
        lineSpacing: CGFloat,
        color: UIColor?,
        alignment: NSTextAlignment
    ) -> NSAttributedString {
        return (self as String).makePrettyString(font: font,
                                                 lineSpacing: lineSpacing,
                                                 color: color,
                                                 alignment: alignment)
    }
    
    @objc(makePrettyStringWithFont:lineSpacing:color:)
    /// 构建漂亮字符串
    /// - Parameters:
    ///   - font: 字体
    ///   - lineSpacing: 行间距
    ///   - color: 颜色
    /// - Returns: 返回对应的富文本字符串
    public func ___objc_makePrettyString(
        font: UIFont,
        lineSpacing: CGFloat,
        color: UIColor?
    ) -> NSAttributedString {
        return (self as String).makePrettyString(font: font,
                                                 lineSpacing: lineSpacing,
                                                 color: color,
                                                 alignment: nil)
    }
    
    @objc(makePrettyStringWithFont:lineSpacing:)
    /// 构建漂亮字符串
    /// - Parameters:
    ///   - font: 字体
    ///   - lineSpacing: 行间距
    ///   - color: 颜色
    ///   - alignment: 对齐方式
    /// - Returns: 返回对应的富文本字符串
    public func ___objc_makePrettyString(
        font: UIFont,
        lineSpacing: CGFloat
    ) -> NSAttributedString {
        return (self as String).makePrettyString(font: font,
                                                 lineSpacing: lineSpacing,
                                                 color: nil,
                                                 alignment: nil)
    }
}
