//
//  DateExtension.swift
//  FoundationExtensions
//
//  Created by 李泽群 on 2019/4/24.
//  Copyright © 2019 dancewithpeng@gmail.com All rights reserved.
//

import Foundation

// MARK: - Extension
public extension Date {
    
    /// 把Date实例转成指定格式字符串
    ///
    /// - Parameter format: 指定时间格式
    /// - Returns: 指定格式字符串
    func string(format: String) -> String {
        let formatter: DateFormatter = DateFormatter(format: format)
        return formatter.string(from: self)
    }
}

// MARK: - 字符串时间方法
public extension String {

    /// 把时间字符串转换成Date
    ///
    /// - Parameter format: 源时间字符串
    /// - Returns: 返回源字符串格式的Date实例
    func date(format: String) -> Date? {
        let formatter: DateFormatter = DateFormatter(format: format)
        return formatter.date(from: self)
    }
}

// MARK: - Helper
private extension DateFormatter {
    
    /// 获取指定dateFormat实例的便捷方法
    ///
    /// - Parameter format: 时间格式
    convenience init(format: String) {
        self.init()
        self.dateFormat = format
    }
}


