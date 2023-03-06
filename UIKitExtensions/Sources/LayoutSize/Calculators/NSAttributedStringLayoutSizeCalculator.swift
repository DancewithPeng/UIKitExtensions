//
//  NSAttributedStringLayoutSizeCalculator.swift
//  UIKitExtensions
//
//  Created by 张鹏 on 2023/3/6.
//  Copyright © 2023 dancewithpeng@gmail.com. All rights reserved.
//

import UIKit

/// 富文本字符串布局尺寸计算器
class NSAttributedStringLayoutSizeCalculator: TextLayoutSizeCalculator {
    
    let content: NSAttributedString

    init(content: NSAttributedString) {
        self.content = content
    }
    
    func calculateContentLayoutSize(maxSize: CGSize, lines: Int = 0) -> CGSize {
        let targetMaxSize: CGSize
        if lines > 0, content.string.count > 0 {
            let attributes = content.attributes(at: 0, effectiveRange: nil)
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
        
        let result = content.boundingRect(with: targetMaxSize,
                                          options: [.usesFontLeading, .usesLineFragmentOrigin],
                                          context: nil).size
        return CGSize(width: ceil(result.width), height: ceil(result.height))
    }
}
