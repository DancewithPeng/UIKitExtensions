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
        
        let targetMaxSize: CGSize
        let targetFont: UIFont
        
        if let font {
            targetFont = font
        } else {
            targetFont = .systemFont(ofSize: 17)
        }
        
        if lines > 0 {
            targetMaxSize = CGSize(width: maxSize.width, height: min(CGFloat(lines) * targetFont.lineHeight, maxSize.height))
        } else {
            targetMaxSize = maxSize
        }
        
        let result = (self as NSString).boundingRect(with: targetMaxSize,
                                                     options: [.usesFontLeading, .usesLineFragmentOrigin],
                                                     attributes: [
                                                      .font: targetFont
                                                     ],
                                                     context: nil).size
        
        return CGSize(width: ceil(result.width), height: ceil(result.height))
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
        
        let targetMaxSize: CGSize
        if lines > 0 {
            let attributes = self.attributes(at: 0, effectiveRange: nil)
            if let font = attributes[.font] as? UIFont {
                let lineHeight: CGFloat
                let lineSpacing: CGFloat
                if let paragraphStyle = attributes[.paragraphStyle] as? NSParagraphStyle {
                    lineSpacing = paragraphStyle.lineSpacing
                    lineHeight = max(paragraphStyle.minimumLineHeight, font.lineHeight)
                } else {
                    lineHeight = font.lineHeight
                    lineSpacing = 0
                }
                
                targetMaxSize = CGSize(width: maxSize.width,
                                       height: CGFloat(lines) * lineHeight + (lineSpacing * CGFloat(lines - 1)))
                
            } else {
                targetMaxSize = maxSize
            }
        } else {
            targetMaxSize = maxSize
        }
        
        let result = self.boundingRect(with: targetMaxSize,
                                       options: [.usesFontLeading, .usesLineFragmentOrigin],
                                       context: nil).size
        return CGSize(width: ceil(result.width), height: ceil(result.height))
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
