//
//  UIViewExtensionController.swift
//  UIKitExtensionsExample
//
//  Created by DancewithPeng on 2019/5/10.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import UIKit
import UIKitExtensions

class UIViewExtensionController: UIViewController {
    
    lazy var testView: UIView = {
        let v = UIView(frame: CGRect.zero)
        v.backgroundColor = UIColor.blue
        return v
    }()
    
    @IBOutlet weak var subviewContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        // 测试布局
        view.addSubview(testView)
        
        testView.translatesAutoresizingMaskIntoConstraints = false
        testView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        testView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        testView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        testView.bottomAnchor.constraint(equalTo: view.compatibleSafeAreaLayoutGuide.topAnchor, constant: 44).isActive = true
        
        print(view.compatibleSafeAreaInsets)
        
        // 测试遍历子View
        subviewContainer.recursiveTraversalSubviews { (view) in
            print(view)
        }
        
        navigationController?.navigationBar.recursiveTraversalSubviews { (view) in
            print(view)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(view.compatibleSafeAreaInsets)
    }
}
