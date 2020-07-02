//
//  Stringable.swift
//  FoundationExtensions
//
//  Created by 张鹏 on 2019/9/18.
//  Copyright © 2019 dancewithpeng@gmail.com All rights reserved.
//

import Foundation


/// 可字符串化的
public protocol Stringable {
    
    /// 字符串
    var string: String { get }
}

// MARK: - `Stringable`默认实现
public extension Stringable {
    var string: String {
        return String(describing: self)
    }
}

// MARK: - Stringable For String
extension String: Stringable {
    public var string: String {
        return self
    }
}
