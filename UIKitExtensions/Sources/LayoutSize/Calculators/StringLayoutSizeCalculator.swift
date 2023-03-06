//
//  StringLayoutSizeCalculator.swift
//  UIKitExtensions
//
//  Created by 张鹏 on 2023/3/6.
//  Copyright © 2023 dancewithpeng@gmail.com. All rights reserved.
//

import UIKit

/// 字符串布局尺寸计算器
class StringLayoutSizeCalculator: TextLayoutSizeCalculator {
    
    let content: String
    let font: UIFont?

    init(content: String, font: UIFont?) {
        self.content = content
        self.font = font
    }
    
    func calculateContentLayoutSize(maxSize: CGSize, lines: Int = 0) -> CGSize {
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
        
        let result = (content as NSString).boundingRect(with: targetMaxSize,
                                                        options: [.usesFontLeading, .usesLineFragmentOrigin],
                                                        attributes: [
                                                            .font: targetFont
                                                        ],
                                                        context: nil).size
        
        return CGSize(width: ceil(result.width), height: ceil(result.height))
    }
}
