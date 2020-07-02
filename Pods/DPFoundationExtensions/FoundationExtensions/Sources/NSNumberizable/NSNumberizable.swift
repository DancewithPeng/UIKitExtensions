//
//  NSNumberizable.swift
//  FoundationExtensions
//
//  Created by 张鹏 on 2019/9/18.
//  Copyright © 2019 dancewithpeng@gmail.com All rights reserved.
//

import Foundation


/// 可转换成`NSNumber`的
public protocol NSNumberizable {
    
    /// `NSNumber`类型的数字
    var number: NSNumber { get }
}

// MARK: - NSNumberizable For NSNumber
extension NSNumber: NSNumberizable {
    public var number: NSNumber {
        return self
    }
}
