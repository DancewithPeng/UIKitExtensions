//
//  StringLayoutSizeExtension.swift
//  UIKitExtensions
//
//  Created by DancewithPeng on 2019/6/6.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import Foundation

// MARK: - 计算`String`在UILabel布局中的尺寸
public extension String {
    
    /// 计算`String`在UILabel布局中的尺寸
    ///
    /// - Parameters:
    ///   - maxSize: 最大尺寸
    ///   - font: 字体
    ///   - lines: 文本行数
    /// - Returns: 返回`String`在UILabel布局中所占的尺寸
    func labelLayoutSizeThatFits(_ maxSize: CGSize, font: UIFont? = nil, lines: Int = 0) -> CGSize {
        let label = UILabel(frame: CGRect(origin: CGPoint.zero, size: maxSize))
        label.text = self
        label.numberOfLines = lines
        
        if let font = font {
            label.font = font
        }
        return label.sizeThatFits(maxSize)
    }
    
    /// 计算`string`在UILabel布局中的高度
    ///
    /// - Parameters:
    ///   - maxWidth: 最大宽度
    ///   - font: 字体
    ///   - lines: 文本行数
    /// - Returns: 返回`string`在UILabel布局中所占的高度
    func labelLayoutHeightThatFits(width maxWidth: CGFloat, font: UIFont, lines: Int = 0) -> CGFloat {
        return labelLayoutSizeThatFits(CGSize(width: maxWidth, height: CGFloat.greatestFiniteMagnitude), font: font, lines: lines).height
    }
    
    /// 计算`string`在UILabel布局中的宽度
    ///
    /// - Parameters:
    ///   - maxHeight: 最大高度
    ///   - font: 字体
    ///   - lines: 文本行数
    /// - Returns: 返回`string`在UILabel布局中所占的宽度
    func labelLayoutWidthThatFits(height maxHeight: CGFloat, font: UIFont, lines: Int = 0) -> CGFloat {
        return labelLayoutSizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: maxHeight), font: font, lines: lines).width
    }
}


// MARK: - 计算`NSAttributedString`在UILabel布局中的尺寸
public extension NSAttributedString {
    
    /// 计算`NSAttributedString`在UILabel布局中的尺寸
    ///
    /// - Parameters:
    ///   - maxSize: 最大尺寸
    ///   - lines: 文本行数
    /// - Returns: 返回`NSAttributedString`在UILabel布局中所占的尺寸
    func labelLayoutSizeThatFits(_ maxSize: CGSize, lines: Int = 0) -> CGSize {
        let label = UILabel(frame: CGRect(origin: CGPoint.zero, size: maxSize))
        label.attributedText = self
        label.numberOfLines = lines
        return label.sizeThatFits(maxSize)
    }
    
    /// 计算`NSAttributedString`在UILabel布局中的高度
    ///
    /// - Parameters:
    ///   - maxWidth: 最大宽度
    ///   - lines: 文本行数
    /// - Returns: 返回`NSAttributedString`在UILabel布局中所占的高度
    func labelLayoutHeightThatFits(width maxWidth: CGFloat, lines: Int = 0) -> CGFloat {
        return labelLayoutSizeThatFits(CGSize(width: maxWidth, height: CGFloat.greatestFiniteMagnitude), lines: lines).height
    }
    
    /// 计算`NSAttributedString`在UILabel布局中的宽度
    ///
    /// - Parameters:
    ///   - maxHeight: 最大高度
    ///   - lines: 文本行数
    /// - Returns: 返回`NSAttributedString`在UILabel布局中所占的宽度
    func labelLayoutWidthThatFits(height maxHeight: CGFloat, lines: Int = 0) -> CGFloat {
        return labelLayoutSizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: maxHeight), lines: lines).width
    }
}
