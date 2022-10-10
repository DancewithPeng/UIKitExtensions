//
//  UITextViewExtension.swift
//  UIKitExtensions
//
//  Created by DancewithPeng on 2019/7/18.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import UIKit

// MARK: - UITextView + UITextViewLimiter
public extension UITextView {
    
    /// 设置输入框限制器，限制器会接管UITextView的delegate
    var limiter: UITextViewLimiter? {
        get {
            guard let limiter = objc_getAssociatedObject(self, UITextView.limiterKey) as? UITextViewLimiter else {
                return nil
            }
            
            return limiter
        }
        set {
            newValue?.textView = self
            delegate = newValue
            objc_setAssociatedObject(self, UITextView.limiterKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// 设置输入框限制器，⚠️ 此闭包会被UITextView持续持有，请调用方处理好循环引用的问题
    ///
    /// - Parameter limiterVerifier: 限制器的逻辑处理闭包
    func setLimiter(_ limiterVerifier: @escaping (UITextView, UITextViewLimiter, String?, NSRange, String) -> Bool) {
        limiter = UITextViewLimiter(verifier: limiterVerifier)
    }
    
    /// 设置输入框限制器，⚠️ 此闭包会被UITextView持续持有，请调用方处理好循环引用的问题
    ///
    /// - Parameter limiterVerifier: 限制器的逻辑处理闭包
    func setLimiter(_ limiterVerifier: @escaping (UITextView, String) -> Bool) {
        limiter = UITextViewLimiter(verifier: { (textView, limiter, currentString, replacementRange, appendedString) -> Bool in
            let combinedString = limiter.combine(currentString: currentString, replacementRange: replacementRange, appendedString: appendedString)
            return limiterVerifier(textView, combinedString)
        })
    }
}

// MARK: - Constants
private extension UITextView {
    static let limiterKey: String = "UITextView.limiterKey"
}
