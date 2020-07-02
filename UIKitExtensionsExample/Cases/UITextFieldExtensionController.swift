//
//  UITextFieldExtensionController.swift
//  UIKitExtensionsExample
//
//  Created by 张鹏 on 2019/4/24.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import UIKit
import Toast_Swift

class UITextFieldExtensionController: UIViewController {
    
    /// 数字限制输入框
    @IBOutlet weak var numberLimitTextField: UITextField!
    
    /// 字数限制输入框
    @IBOutlet weak var countLimitTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 添加输入限制器
        numberLimitTextField.setLimiter { [weak self] (textField, limiter, currentString, replamentRange, appendString) -> Bool in
            
            // 判定只能输入数字，非数字不能输入
            guard NSPredicate(format: "SELF MATCHES %@", "^[0-9]*$").evaluate(with: appendString) else {
                self?.view.makeToast("请输入数字", duration: 1.0, position: .center)
                return false
            }
            
            return true
        }
        
        
        // 限制只能输入指定长度的字符
//        countLimitTextField.setLimiter { [weak self] (textField, limiter, currentString, replamentRange, appendString) -> Bool in
//            let str = limiter.combine(currentString: currentString, replacementRange: replamentRange, appendedString: appendString)
//            guard str.count <= 8 else {
//                self?.view.makeToast("只能输入8个字符", duration: 1.0, position: .center)
//                return false
//            }
//
//            return true
//        }
        
        // 限制只能输入指定长度的字符
        countLimitTextField.setLimiter { [weak self] (textField, combinedString) -> Bool in
            guard combinedString.count <= 8 else {
                self?.view.makeToast("只能输入8个字符", duration: 1.0, position: .center)
                return false
            }
            
            return true
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
