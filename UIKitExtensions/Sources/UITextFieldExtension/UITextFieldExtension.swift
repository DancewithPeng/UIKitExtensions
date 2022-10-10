//
//  UITextFieldExtension.swift
//  UIKitExtensions
//
//  Created by DancewithPeng on 2019/4/23.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import Foundation
import ObjectiveC

// MARK: - UITextField + UITextFieldLimiter
public extension UITextField {
    
    /// 设置输入框限制器，限制器会接管UITextField的delegate
    var limiter: UITextFieldLimiter? {
        get {
            guard let limiter = objc_getAssociatedObject(self, UITextField.limiterKey) as? UITextFieldLimiter else {
                return nil
            }
            
            return limiter
        }
        set {
            newValue?.textField = self
            delegate = newValue
            objc_setAssociatedObject(self, UITextField.limiterKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// 设置输入框限制器，⚠️ 此闭包会被UITextField持续持有，请调用方处理好循环引用的问题
    ///
    /// - Parameter limiterVerifier: 限制器的逻辑处理闭包
    func setLimiter(_ limiterVerifier: @escaping (UITextField, UITextFieldLimiter, String?, NSRange, String) -> Bool) {
        limiter = UITextFieldLimiter(verifier: limiterVerifier)
    }
    
    /// 设置输入框限制器，⚠️ 此闭包会被UITextField持续持有，请调用方处理好循环引用的问题
    ///
    /// - Parameter limiterVerifier: 限制器的逻辑处理闭包
    func setLimiter(_ limiterVerifier: @escaping (UITextField, String) -> Bool) {
        limiter = UITextFieldLimiter(verifier: { (textField, limiter, currentString, replacementRange, appendedString) -> Bool in
            let combinedString = limiter.combine(currentString: currentString, replacementRange: replacementRange, appendedString: appendedString)
            return limiterVerifier(textField, combinedString)
        })
    }
}


// MARK: - Constants
private extension UITextField {
    static let limiterKey: String = "UITextField.limiterKey"
}
