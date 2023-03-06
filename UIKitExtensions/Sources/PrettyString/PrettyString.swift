//
//  PrettyStringBuilder.swift
//  UIKitExtensions
//
//  Created by 张鹏 on 2023/3/6.
//  Copyright © 2023 dancewithpeng@gmail.com. All rights reserved.
//

import Foundation

/// 漂亮字符串
struct PrettyString {
    
    let content: String
    let style: Style
    
    func makeAttributedString() -> NSAttributedString {
        return NSAttributedString(string: content,
                                  attributes: style.makeAttributes())
    }
}

extension PrettyString {
    
    struct Style {
        let font: UIFont
        let color: UIColor?
        let alignment: NSTextAlignment?
        let lineSpacing: CGFloat?
        
        init(font: UIFont, color: UIColor?, alignment: NSTextAlignment?, lineSpacing: CGFloat?) {
            self.font        = font
            self.color       = color
            self.alignment   = alignment
            self.lineSpacing = lineSpacing
        }
        
        init(font: UIFont, color: UIColor?, alignment: NSTextAlignment?, lineHeight: CGFloat?) {
            if let lineHeight {
                self.init(font: font, color: color, alignment: alignment, lineSpacing: lineHeight - font.lineHeight)
            } else {
                self.init(font: font, color: color, alignment: alignment, lineSpacing: nil)
            }
        }
        
        func makeAttributes() -> [NSAttributedString.Key: Any] {
            var targetAttributes: [NSAttributedString.Key: Any] = [
                .font: font
            ]
            
            if let color {
                targetAttributes[.foregroundColor] = color
            }
            
            if containsParagraphStyle {
                let paragraphStyle = NSMutableParagraphStyle()
                if let alignment {
                    paragraphStyle.alignment = alignment
                }
                
                if let lineSpacing {
                    paragraphStyle.lineSpacing = lineSpacing
                }
                
                targetAttributes[.paragraphStyle] = paragraphStyle
            }
            
            return targetAttributes
        }
        
        var containsParagraphStyle: Bool {
            if lineSpacing != nil {
                return true
            }
            
            if alignment != nil {
                return true
            }
            
            return false
        }
    }
}
