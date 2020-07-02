//
//  UITextFieldLimiter.swift
//  UIKitExtensions
//
//  Created by 张鹏 on 2019/4/23.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import Foundation

/// UITextField输入限制器
open class UITextFieldLimiter: NSObject {
    
    /// 对应的输入框
    open weak var textField: UITextField?
    
    /// 校验器
    public var verifier: ((_ textField: UITextField, _ limiter: UITextFieldLimiter, _ currentString: String?, _ replacementRange: NSRange, _ appendedString: String) -> Bool)?
    
    /// 便捷初始化方法，初始化的同时，设置校验器
    ///
    /// - Parameter verifier: 校验器
    public init(verifier: ((UITextField, UITextFieldLimiter, String?, NSRange, String) -> Bool)? = nil) {
        super.init()
        self.verifier = verifier
    }
    
    /// 校验文本，确认是否允许输入，子类应该重写此方法来返回自定义的校验逻辑
    ///
    /// - Parameters:
    ///   - currentString: TextField当前文本
    ///   - replacementRange: 原始文本被替换的范围
    ///   - appendedString: 将要追加的文本
    /// - Returns: 如果允许输入，返回true，不允许输入，返回false，默认返回true
    open func verify(with currentString: String?, replacementRange: NSRange, appendedString: String) -> Bool {
        return true
    }
}

// MARK: - UITextFieldLimiter的便捷方法
public extension UITextFieldLimiter {
    
    /// 根据currentString、replacementRange、appendedString，三个值，组合出最终的字符串
    ///
    /// - Parameters:
    ///   - currentString: TextField当前文本
    ///   - replacementRange: 原始文本被替换的范围
    ///   - appendedString: 将要追加的文本
    /// - Returns: 返回组合后的文本
    final func combine(currentString: String?, replacementRange: NSRange, appendedString: String) -> String {
        
        // 如果原始字符串为空，直接返回追加的字符串
        guard let originalString = currentString else {
            return appendedString
        }
        
        // 如果NSRange转range出错，直接返回追加的字符串
        guard let range = Range(replacementRange, in: originalString) else {
            return appendedString
        }
        
        return originalString.replacingCharacters(in: range, with: appendedString)
    }
}

// MARK: - UITextFieldDelegate
extension UITextFieldLimiter: UITextFieldDelegate {
    
    /// 是否允许输入
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        self.textField = textField
        
        // 删除操作
        guard string.count > 0 else {
            return true
        }
        
        // 拼音输入时标记文本，如果是输入标记文本，允许输入
        if textField.markedTextRange != nil, textField.markedTextRange?.isEmpty == false, range.length == 0 {
            return true
        }
        
        // 如果有校验器，则使用校验器进行校验，如果没有，则使用校验方法
        guard let verifier = self.verifier else {
            // 条件判断
            return verify(with: textField.text, replacementRange: range, appendedString: string)
        }
        
        return verifier(textField, self, textField.text, range, string)
    }
}
