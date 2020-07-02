//
//  StringExtension.swift
//  FoundationExtensions
//
//  Created by 张鹏 on 2019/6/5.
//  Copyright © 2019 dancewithpeng@gmail.com All rights reserved.
//

import Foundation


// MARK: - Random
public extension String {
    
    /// 生产随机字符串
    ///
    /// - Parameters:
    ///   - length: 生成的随机字符串的长度
    ///   - isLetter: 是否仅仅生成字母，true只生成大小写的字母，false会包含数字
    /// - Returns: 返回指定长度的随机字符串
    static func random(length: Int, isLetter: Bool = false) -> String {
        
        guard length > 0 else {
            return ""
        }
        
        var chars = [Character]()
        for _ in 0..<length {
            var num = isLetter ? arc4random_uniform(58) + 65 : arc4random_uniform(75) + 48
            if num>57 && num<65 && isLetter==false {
                num = num%57 + 48
            } else if num>90 && num<97 {
                num = num%90 + 65
            }
            
            if let scalar = UnicodeScalar(num) {
                chars.append(Character(scalar))
            }
        }
        
        return String(chars)
    }
}
