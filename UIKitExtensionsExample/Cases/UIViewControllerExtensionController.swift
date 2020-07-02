//
//  UIViewControllerExtensionController.swift
//  UIKitExtensionsExample
//
//  Created by 张鹏 on 2019/4/24.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import UIKit
import UIKitExtensions

class UIViewControllerExtensionController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func addChildBtnDidClick(_ sender: Any) {
        let childVC = ChildViewController()
        addChild(childVC, layout: .consistentWithParent)
    }
    
    @IBAction func addChildWithFrameBtnDidClick(_ sender: Any) {
        let childVC = ChildViewController()
        addChild(childVC, layout: .frame(frame: CGRect(origin: CGPoint(x: 0, y: 400), size: CGSize(width: view.bounds.size.width, height: view.bounds.size.height-400))))
    }
    
    @IBAction func removeChildBtnDidClick(_ sender: Any) {
        for child in children {
            removeChild(child)
        }
    }
    
    @IBAction func visibleViewControllerBtnDidClick(_ sender: Any) {
        print("当前可见的ViewController：\(String(describing: currentVisibleViewController))")
    }
    
}

extension UIViewControllerExtensionController {
    
    class ChildViewController: UIViewController {
        
        override func viewDidLoad() {
            let label = UILabel()
            label.text = "Child View Controller"
            label.textColor = UIColor.white
            label.textAlignment = .center
            view.backgroundColor = UIColor.lightGray
            
            view.addSubview(label)
            
            label.translatesAutoresizingMaskIntoConstraints = false
            label.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            label.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            label.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }
        
        override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            guard let parentVC = self.parent else {
                return
            }
            
            parentVC.removeChild(self)
        }
    }
}
