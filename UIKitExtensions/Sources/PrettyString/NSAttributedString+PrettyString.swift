//
//  NSAttributedString+PrettyString.swift
//  UIKitExtensions
//
//  Created by 张鹏 on 2023/3/6.
//  Copyright © 2023 dancewithpeng@gmail.com. All rights reserved.
//

import Foundation

// MARK: - NSAttributedString Extensions For PrettyString

extension NSAttributedString {
    
    /// 构建漂亮字符串
    /// - Parameters:
    ///   - content: 内容字符串
    ///   - font: 字体
    ///   - lineHeight: 行高
    ///   - color: 颜色
    ///   - alignment: 对齐方式
    /// - Returns: 返回对应的富文本字符串
    public static func makePrettyString(
        for content: String,
        font: UIFont,
        lineHeight: CGFloat? = nil,
        color: UIColor? = nil,
        alignment: NSTextAlignment? = nil
    ) -> NSAttributedString {
        let style = PrettyString.Style(font: font,
                                       color: color,
                                       alignment: alignment,
                                       lineHeight: lineHeight)
        return PrettyString(content: content, style: style).makeAttributedString()
    }
    
    /// 构建漂亮字符串
    /// - Parameters:
    ///   - content: 内容字符串
    ///   - font: 字体
    ///   - lineSpacing: 行间距
    ///   - color: 颜色
    ///   - alignment: 对齐方式
    /// - Returns: 返回对应的富文本字符串
    public static func makePrettyString(
        for content: String,
        font: UIFont,
        lineSpacing: CGFloat? = nil,
        color: UIColor? = nil,
        alignment: NSTextAlignment? = nil
    ) -> NSAttributedString {
        let style = PrettyString.Style(font: font,
                                       color: color,
                                       alignment: alignment,
                                       lineSpacing: lineSpacing)
        return PrettyString(content: content, style: style).makeAttributedString()
    }
}

// MARK: - Objc Special

extension NSAttributedString {
    
    @objc(makePrettyStringForContent:font:lineHeight:color:alignment:)
    /// 构建漂亮字符串
    /// - Parameters:
    ///   - content: 内容字符串
    ///   - font: 字体
    ///   - lineHeight: 行高
    ///   - color: 颜色
    ///   - alignment: 对齐方式
    /// - Returns: 返回对应的富文本字符串
    public static func ___objc_makePrettyString(
        for content: String,
        font: UIFont,
        lineHeight: CGFloat,
        color: UIColor?,
        alignment: NSTextAlignment
    ) -> NSAttributedString {
        return makePrettyString(for: content,
                                font: font,
                                lineHeight: lineHeight,
                                color: color,
                                alignment: alignment)
    }
    
    @objc(makePrettyStringForContent:font:lineHeight:color:)
    /// 构建漂亮字符串
    /// - Parameters:
    ///   - content: 内容字符串
    ///   - font: 字体
    ///   - lineHeight: 行高
    ///   - color: 颜色
    /// - Returns: 返回对应的富文本字符串
    public static func ___objc_makePrettyString(
        for content: String,
        font: UIFont,
        lineHeight: CGFloat,
        color: UIColor?
    ) -> NSAttributedString {
        return makePrettyString(for: content,
                                font: font,
                                lineHeight: lineHeight,
                                color: color,
                                alignment: nil)
    }
    
    @objc(makePrettyStringForContent:font:lineHeight:)
    /// 构建漂亮字符串
    /// - Parameters:
    ///   - content: 内容字符串
    ///   - font: 字体
    ///   - lineHeight: 行高
    /// - Returns: 返回对应的富文本字符串
    public static func ___objc_makePrettyString(
        for content: String,
        font: UIFont,
        lineHeight: CGFloat
    ) -> NSAttributedString {
        return makePrettyString(for: content,
                                font: font,
                                lineHeight: lineHeight,
                                color: nil,
                                alignment: nil)
    }
    
    @objc(makePrettyStringForContent:font:lineSpacing:color:alignment:)
    /// 构建漂亮字符串
    /// - Parameters:
    ///   - content: 内容字符串
    ///   - font: 字体
    ///   - lineSpacing: 行间距
    ///   - color: 颜色
    ///   - alignment: 对齐方式
    /// - Returns: 返回对应的富文本字符串
    public static func ___objc_makePrettyString(
        for content: String,
        font: UIFont,
        lineSpacing: CGFloat,
        color: UIColor?,
        alignment: NSTextAlignment
    ) -> NSAttributedString {
        return makePrettyString(for: content,
                                font: font,
                                lineSpacing: lineSpacing,
                                color: color,
                                alignment: alignment)
    }
    
    @objc(makePrettyStringForContent:font:lineSpacing:color:)
    /// 构建漂亮字符串
    /// - Parameters:
    ///   - content: 内容字符串
    ///   - font: 字体
    ///   - lineSpacing: 行间距
    ///   - color: 颜色
    /// - Returns: 返回对应的富文本字符串
    public static func ___objc_makePrettyString(
        for content: String,
        font: UIFont,
        lineSpacing: CGFloat,
        color: UIColor?
    ) -> NSAttributedString {
        return makePrettyString(for: content,
                                font: font,
                                lineSpacing: lineSpacing,
                                color: color,
                                alignment: nil)
    }
    
    @objc(makePrettyStringForContent:font:lineSpacing:)
    /// 构建漂亮字符串
    /// - Parameters:
    ///   - content: 内容字符串
    ///   - font: 字体
    ///   - lineSpacing: 行间距
    ///   - color: 颜色
    ///   - alignment: 对齐方式
    /// - Returns: 返回对应的富文本字符串
    public static func ___objc_makePrettyString(
        for content: String,
        font: UIFont,
        lineSpacing: CGFloat
    ) -> NSAttributedString {
        return makePrettyString(for: content,
                                font: font,
                                lineSpacing: lineSpacing,
                                color: nil,
                                alignment: nil)
    }
}

