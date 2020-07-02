//
//  ExtendedViewControllerExample.swift
//  UIKitExtensionsExample
//
//  Created by 张鹏 on 2019/5/20.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import UIKit
import UIKitExtensions
import SnapKit

class ExtendedViewControllerExample: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func pushedButtonDidClick(_ sender: Any) {
        let extendedVC = MyExtendedViewController()
        navigationController?.pushViewController(extendedVC, animated: true)
    }
}


class MyExtendedViewController: ExtendedViewController  {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1.0)
        
        switch navigationController!.viewControllers.count {
        case 2:
            hidesNavigationBar = true
        case 3:
            hidesNavigationBar = false
            transparentNavigationBar = true
        case 4:
            hidesNavigationBar = false
            transparentNavigationBar = false
            hidesNavigationBarSeparator = true
        case 5:
//            hidesNavigationBar = false
//            transparentNavigationBar = false
//            hidesNavigationBarSeparator = false
            navigationBarSeparatorImage = currentBundle.image(named: "线")
        default:
            break
        }
        
        let pushedBtn = UIButton(type: .system)
        pushedBtn.setTitle("下一页", for: .normal)
        view.addSubview(pushedBtn)
        pushedBtn.snp.makeConstraints { (make) in
            make.left.equalTo(view).offset(60)
            make.right.equalTo(view).offset(-60)
            make.height.equalTo(60)
            make.centerY.equalTo(view)
        }
        pushedBtn.addTarget(self, action: #selector(pushedBtnDidClick(_:)), for: .touchUpInside)
        
        let backBtn = UIButton(type: .system)
        backBtn.setTitle("上一页", for: .normal)
        view.addSubview(backBtn)
        backBtn.snp.makeConstraints { (make) in
            make.left.equalTo(view).offset(60)
            make.right.equalTo(view).offset(-60)
            make.height.equalTo(60)
            make.centerY.equalTo(view).offset(-80)
        }
        backBtn.addTarget(self, action: #selector(backBtnDidClick(_:)), for: .touchUpInside)
    }
    
    @objc
    func pushedBtnDidClick(_ sender: Any) {
        navigationController?.pushViewController(MyExtendedViewController(), animated: true)
    }
    
    @objc
    func backBtnDidClick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
