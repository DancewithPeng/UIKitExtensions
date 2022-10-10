//
//  PickingResultExampleViewController.swift
//  UIKitExtensionsExample
//
//  Created by DancewithPeng on 2019/9/16.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import UIKit
import UIKitExtensions
import DPFoundationExtensions


/// 选择结果测试用例
class PickingResultExampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func showCaseButtonDidClick(_ sender: Any) {
        
        show(options: ["香蕉", "苹果", "🌰", "🍑", "随便"]) { (result) in
            switch result {
            case let .pick(fruit):
                print("选择了：\(fruit)")
            case .cancel:
                print("取消")
            }
        }
    }
}

extension PickingResultExampleViewController {
    
    func show(options: [String], completion: ((PickResult<String>) -> Void)?) {
        let alertController = UIAlertController(title: "测试", message: "选择选项", preferredStyle: .alert)
        for option in options {
            let action = UIAlertAction(title: option, style: .default) { (action) in
                completion?(.pick(option))
            }
            alertController.addAction(action)
        }
        
        let cancelAction = UIAlertAction(title: "取消", style: .cancel) { (action) in
            completion?(.cancel)
        }
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
