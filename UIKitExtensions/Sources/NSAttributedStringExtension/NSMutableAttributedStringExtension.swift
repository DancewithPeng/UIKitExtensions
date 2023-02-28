//
//  NSMutableAttributedStringExtension.swift
//  FoundationExtensions
//
//  Created by 李泽群 on 2019/5/10.
//  Copyright © 2019 dancewithpeng@gmail.com All rights reserved.
//

import Foundation


// MARK: - Extension
extension NSMutableAttributedString {
    
    /// NSMutableAttributedString添加样式便利方法
    ///
    /// - Parameters:
    ///   - color: 字体颜色
    ///   - font: 字体
    ///   - lineSpace: 行间距
    ///   - wordSpace: 字间距
    ///   - alignment: 对齐方式
    ///   - range: 样式引用范围
    public func addStyle(color: UIColor? = nil,
                         font: UIFont? = nil,
                         lineSpace: CGFloat? = nil,
                         wordSpace: CGFloat? = nil,
                         alignment: NSTextAlignment? = nil,
                         at range: NSRange) {
        
        var stringAttributes = [NSAttributedString.Key: Any]()
        
        // 字体颜色
        if let locColor = color {
            stringAttributes[NSAttributedString.Key.foregroundColor] = locColor
        }
        
        // 设置字体
        if let locFont = font {
            stringAttributes[NSAttributedString.Key.font] = locFont
        }
        
        // 设置字间距
        if let locWordSpace = wordSpace {
            stringAttributes[NSAttributedString.Key.kern] = locWordSpace
        }
        
        // 设置行间距和对齐模式
        if lineSpace != nil || alignment != nil {
            
            let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
            
            // 行间距
            if let locLineSpace = lineSpace {
                paragraphStyle.lineSpacing = locLineSpace
            }
            
            // 对齐模式
            if let locAlignment = alignment {
                paragraphStyle.alignment = locAlignment
            }
            
            stringAttributes[NSAttributedString.Key.paragraphStyle] = paragraphStyle
        }
        
        guard stringAttributes.count > 0 else {
            return
        }
        
        addAttributes(stringAttributes, range: range)
    }
    
    /// NSMutableAttributedString添加图片
    ///
    /// - Parameters:
    ///   - image: 需要添加的image
    ///   - rect: 图片rect
    ///   - space: 字间距
    ///   - range: 替换位置
    public func append(image: UIImage, space: CGFloat? = nil, rect: CGRect, at range: NSRange) {
        
        let imageAttachment: NSTextAttachment = NSTextAttachment()
        imageAttachment.image = image
        imageAttachment.bounds = rect
        let imageString = NSMutableAttributedString(attachment: imageAttachment)
        
        // 设置图片间距
        if let locSpace = space {
            
            let stringAttributes: [NSAttributedString.Key: Any] = [
                NSAttributedString.Key.kern: locSpace
            ]
            
            if space! >= 2 {
                imageString.append(NSAttributedString(string: "\u{2006}"))
            }
            
            imageString.addAttributes(stringAttributes, range: NSRange(location: 0, length: imageString.length))
        }
        
        // 插入指定位置
        replaceCharacters(in: range, with: imageString)
    }
}
