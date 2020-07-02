//
//  UIDeviceExtensionViewController.swift
//  UIKitExtensionsExample
//
//  Created by 张鹏 on 2019/4/26.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import UIKit
import UIKitExtensions

class UIDeviceExtensionViewController: UIViewController {

    @IBOutlet weak var modelNameLabel: UILabel!
    @IBOutlet weak var notchScreenLabel: UILabel!
    @IBOutlet weak var uuidLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(UIDevice.current.modelIdentifier)
        print(UIDevice.current.modelName)        
        
        modelNameLabel.text = "Model Identifier is: \(UIDevice.current.modelIdentifier) & Name is \(UIDevice.current.modelName)"
        notchScreenLabel.text = "Notch Screen: \(UIScreen.main.hasNotch ? "true" : "false")"
        uuidLabel.text = "UUID: \(UIDevice.current.persistentUUID)"
        
        
        if #available(iOS 11.3, *) {
            if let cstr = SecCopyErrorMessageString(-34018, nil) {
                let str = String(cstr)
                print("Error: \(str)")
            }
        } else {
            // Fallback on earlier versions
        }
    }
}
