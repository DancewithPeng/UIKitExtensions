//
//  FilePath.swift
//  FoundationExtensions
//
//  Created by 张鹏 on 2019/5/31.
//  Copyright © 2019 dancewithpeng@gmail.com All rights reserved.
//

import Foundation


/// 文件路径
public enum FilePath {
    
    /// 用户`Document`文件夹路径
    public static let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    
    /// 应用`Library`文件夹路径
    public static let libraryDirectory = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first!
    
    /// 应用临时文件夹
    public static let tempDirectory = NSTemporaryDirectory()
    
    /// 用户`Home`文件夹路径
    public static let homeDirectory = NSHomeDirectory()
}

// MARK: - String To URL
public extension String {
    
    /// 文件URL
    var fileURL: URL {
        return URL(fileURLWithPath: self)
    }
    
    /// 普通URL
    var url: URL? {
        return URL(string: self)
    }
}
