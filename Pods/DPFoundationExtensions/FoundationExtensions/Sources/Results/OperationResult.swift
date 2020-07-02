//
//  OperationResult.swift
//  FoundationExtensions
//
//  Created by 张鹏 on 2020/1/15.
//  Copyright © 2020 dancewithpeng@gmail.com All rights reserved.
//

import Foundation


/// 操作结果
/// - success: 成功
/// - failure: 失败
/// - cancel: 取消
public enum OperationResult<Success, Failure> where Failure : Error {
    case success(Success)
    case failure(Failure)
    case cancel
}
