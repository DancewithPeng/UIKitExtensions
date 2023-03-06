//
//  NSAttributedString+LayoutSize.swift
//  UIKitExtensions
//
//  Created by 张鹏 on 2023/3/6.
//  Copyright © 2023 dancewithpeng@gmail.com. All rights reserved.
//

import Foundation

// MARK: - `NSAttributedString` Layout Size

public extension NSAttributedString {
    
    @objc(layoutSizeThatFitsSize:lines:)
    /// 计算`NSAttributedString`在布局中的尺寸
    ///
    /// - Parameters:
    ///   - maxSize: 最大尺寸
    ///   - lines: 文本行数
    /// - Returns: 返回`NSAttributedString`在UILabel布局中所占的尺寸
    func layoutSizeThatFits(size maxSize: CGSize, lines: Int = 0) -> CGSize {
        return NSAttributedStringLayoutSizeCalculator(content: self).calculateContentLayoutSize(maxSize: maxSize,
                                                                                                lines: lines)
    }
    
    @objc(layoutHeightThatFitsWidth:lines:)
    /// 计算`NSAttributedString`在UILabel布局中的高度
    ///
    /// - Parameters:
    ///   - maxWidth: 最大宽度
    ///   - lines: 文本行数
    /// - Returns: 返回`NSAttributedString`在UILabel布局中所占的高度
    func layoutHeightThatFits(width maxWidth: CGFloat, lines: Int = 0) -> CGFloat {
        return layoutSizeThatFits(size: CGSize(width: maxWidth, height: CGFloat.greatestFiniteMagnitude),
                                  lines: lines).height
    }
    
    @objc(layoutWidthThatFitsHeight:lines:)
    /// 计算`NSAttributedString`在UILabel布局中的宽度
    ///
    /// - Parameters:
    ///   - maxHeight: 最大高度
    ///   - lines: 文本行数
    /// - Returns: 返回`NSAttributedString`在UILabel布局中所占的宽度
    func layoutWidthThatFits(height maxHeight: CGFloat, lines: Int = 0) -> CGFloat {
        return layoutSizeThatFits(size: CGSize(width: CGFloat.greatestFiniteMagnitude, height: maxHeight),
                                  lines: lines).width
    }
}

// MARK: - Objc Special

public extension NSAttributedString {
    
    @objc(layoutSizeThatFitsSize:)
    /// 计算`NSAttributedString`在布局中的尺寸
    ///
    /// - Parameters:
    ///   - maxSize: 最大尺寸
    /// - Returns: 返回`NSAttributedString`在UILabel布局中所占的尺寸
    func ___objc_layoutSizeThatFits(size maxSize: CGSize) -> CGSize {
        return layoutSizeThatFits(size: maxSize)
    }
    
    @objc(layoutHeightThatFitsWidth:)
    /// 计算`NSAttributedString`在UILabel布局中的高度
    ///
    /// - Parameters:
    ///   - maxWidth: 最大宽度
    /// - Returns: 返回`NSAttributedString`在UILabel布局中所占的高度
    func ___objc_layoutHeightThatFits(width maxWidth: CGFloat) -> CGFloat {
        return layoutSizeThatFits(size: CGSize(width: maxWidth, height: CGFloat.greatestFiniteMagnitude),
                                  lines: 0).height
    }
    
    @objc(layoutWidthThatFitsHeight:)
    /// 计算`NSAttributedString`在UILabel布局中的宽度
    ///
    /// - Parameters:
    ///   - maxHeight: 最大高度
    /// - Returns: 返回`NSAttributedString`在UILabel布局中所占的宽度
    func ___objc_layoutWidthThatFits(height maxHeight: CGFloat) -> CGFloat {
        return layoutSizeThatFits(size: CGSize(width: CGFloat.greatestFiniteMagnitude, height: maxHeight),
                                  lines: 0).width
    }
}

