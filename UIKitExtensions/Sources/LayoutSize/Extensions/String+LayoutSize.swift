//
//  String+LayoutSize.swift
//  UIKitExtensions
//
//  Created by 张鹏 on 2023/3/6.
//  Copyright © 2023 dancewithpeng@gmail.com. All rights reserved.
//

import UIKit

// MARK: - `String` Layout Size

public extension String {
    
    /// 计算`String`在l布局中的尺寸
    ///
    /// - Parameters:
    ///   - maxSize: 最大尺寸
    ///   - font: 字体
    ///   - lines: 文本行数
    /// - Returns: 返回`String`在UILabel布局中所占的尺寸
    func layoutSizeThatFits(size maxSize: CGSize, font: UIFont? = nil, lines: Int = 0) -> CGSize {
        return StringLayoutSizeCalculator(
            content: self,
            font: font
        ).calculateContentLayoutSize(
            maxSize: maxSize,
            lines: lines
        )
    }
    
    /// 计算`string`在布局中的高度
    ///
    /// - Parameters:
    ///   - maxWidth: 最大宽度
    ///   - font: 字体
    ///   - lines: 文本行数
    /// - Returns: 返回`string`在UILabel布局中所占的高度
    func layoutHeightThatFits(width maxWidth: CGFloat, font: UIFont, lines: Int = 0) -> CGFloat {
        return layoutSizeThatFits(size: CGSize(width: maxWidth, height: CGFloat.greatestFiniteMagnitude),
                                  font: font,
                                  lines: lines).height
    }
    
    /// 计算`string`在布局中的宽度
    ///
    /// - Parameters:
    ///   - maxHeight: 最大高度
    ///   - font: 字体
    ///   - lines: 文本行数
    /// - Returns: 返回`string`在UILabel布局中所占的宽度
    func layoutWidthThatFits(height maxHeight: CGFloat, font: UIFont, lines: Int = 0) -> CGFloat {
        return layoutSizeThatFits(size: CGSize(width: CGFloat.greatestFiniteMagnitude, height: maxHeight),
                                  font: font,
                                  lines: lines).width
    }
}

// MARK: - Objc Special

public extension NSString {
    
    @objc(layoutSizeThatFitsSize:font:lines:)
    /// 计算`NSString`在l布局中的尺寸
    ///
    /// - Parameters:
    ///   - maxSize: 最大尺寸
    ///   - font: 字体
    ///   - lines: 文本行数
    /// - Returns: 返回`String`在UILabel布局中所占的尺寸
    func ___objc_layoutSizeThatFits(size maxSize: CGSize, font: UIFont? = nil, lines: Int) -> CGSize {
        return (self as String).layoutSizeThatFits(size: maxSize,
                                                   font: font,
                                                   lines: lines)
    }
    
    @objc(layoutSizeThatFitsSize:font:)
    /// 计算`NSString`在l布局中的尺寸
    ///
    /// - Parameters:
    ///   - maxSize: 最大尺寸
    ///   - font: 字体
    /// - Returns: 返回`String`在UILabel布局中所占的尺寸
    func ___objc_layoutSizeThatFits(size maxSize: CGSize, font: UIFont? = nil) -> CGSize {
        return ___objc_layoutSizeThatFits(size: maxSize,
                                          font: font,
                                          lines: 0)
    }
    
    @objc(layoutHeightThatFitsWidth:font:lines:)
    /// 计算`NSString`在布局中的高度
    ///
    /// - Parameters:
    ///   - maxWidth: 最大宽度
    ///   - font: 字体
    ///   - lines: 文本行数
    /// - Returns: 返回`string`在UILabel布局中所占的高度
    func ___objc_layoutHeightThatFits(width maxWidth: CGFloat, font: UIFont, lines: Int) -> CGFloat {
        return ___objc_layoutSizeThatFits(size: CGSize(width: maxWidth, height: CGFloat.greatestFiniteMagnitude),
                                          font: font,
                                          lines: lines).height
    }
    
    @objc(layoutHeightThatFitsWidth:font:)
    /// 计算`NSString`在布局中的高度
    ///
    /// - Parameters:
    ///   - maxWidth: 最大宽度
    ///   - font: 字体
    /// - Returns: 返回`string`在UILabel布局中所占的高度
    func ___objc_layoutHeightThatFits(width maxWidth: CGFloat, font: UIFont) -> CGFloat {
        return ___objc_layoutSizeThatFits(size: CGSize(width: maxWidth, height: CGFloat.greatestFiniteMagnitude),
                                          font: font,
                                          lines: 0).height
    }
    
    @objc(layoutWidthThatFitsHeight:font:lines:)
    /// 计算`NSString`在布局中的宽度
    ///
    /// - Parameters:
    ///   - maxHeight: 最大高度
    ///   - font: 字体
    ///   - lines: 文本行数
    /// - Returns: 返回`string`在UILabel布局中所占的宽度
    func ___objc_layoutWidthThatFits(height maxHeight: CGFloat, font: UIFont, lines: Int = 0) -> CGFloat {
        return ___objc_layoutSizeThatFits(size: CGSize(width: CGFloat.greatestFiniteMagnitude, height: maxHeight),
                                          font: font,
                                          lines: lines).width
    }
    
    @objc(layoutWidthThatFitsHeight:font:)
    /// 计算`NSString`在布局中的宽度
    ///
    /// - Parameters:
    ///   - maxHeight: 最大高度
    ///   - font: 字体
    /// - Returns: 返回`string`在UILabel布局中所占的宽度
    func ___objc_layoutWidthThatFits(height maxHeight: CGFloat, font: UIFont) -> CGFloat {
        return ___objc_layoutSizeThatFits(size: CGSize(width: CGFloat.greatestFiniteMagnitude, height: maxHeight),
                                          font: font,
                                          lines: 0).width
    }
}
