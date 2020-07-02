//
//  PickResult.swift
//  FoundationExtensions
//
//  Created by 张鹏 on 2020/1/15.
//  Copyright © 2020 dancewithpeng@gmail.com All rights reserved.
//

import Foundation

/// 选择结果
/// - pick: 选择了某个选项
/// - cancel: 取消选择
public enum PickResult<Option> {
    case pick(Option)
    case cancel
}
