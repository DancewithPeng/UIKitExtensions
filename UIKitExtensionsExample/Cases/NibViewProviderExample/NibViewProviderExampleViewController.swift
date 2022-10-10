//
//  NibViewProviderExampleViewController.swift
//  UIKitExtensionsExample
//
//  Created by DancewithPeng on 2019/8/8.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import UIKit


/// `NibViewProvider`的测试用例
class NibViewProviderExampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let sameNameView = SameNameView.makeFromNib() else {
            assertionFailure("从xib加载失败")
            return
        }
        
        view.addSubview(sameNameView)
        sameNameView.textlabel.text = sameNameView.textlabel.text?.appending("啊哈哈哈哈")
        sameNameView.translatesAutoresizingMaskIntoConstraints = false
        sameNameView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        sameNameView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        sameNameView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        sameNameView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        guard let diffNameView = DifferentNameView.makeFromNib("DifferentNameView___asdf") else {
            assertionFailure("从xib加载失败")
            return
        }
        
        view.addSubview(diffNameView)
        diffNameView.textLabel.text = diffNameView.textLabel.text?.appending("啊啦啊啦啦啦")
        
        diffNameView.translatesAutoresizingMaskIntoConstraints = false
        diffNameView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        diffNameView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        diffNameView.topAnchor.constraint(equalTo: sameNameView.bottomAnchor, constant: 15).isActive = true
        diffNameView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        assert(DemoView.makeFromNib("DifferentNameView___asdf") == nil)
    }
}
