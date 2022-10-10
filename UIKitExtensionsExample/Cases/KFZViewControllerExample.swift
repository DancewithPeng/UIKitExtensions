//
//  ExtendedViewControllerExample.swift
//  UIKitExtensionsExample
//
//  Created by DancewithPeng on 2019/5/20.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import UIKit
import UIKitExtensions
import SnapKit

class ExtendedViewControllerExample: ExtendedViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.hidesNavigationBar = false
        self.hidesNavigationBarSeparator = false
    }
    
    @IBAction func pushedButtonDidClick(_ sender: Any) {
        let extendedVC = MyExtendedViewController()
        navigationController?.pushViewController(extendedVC, animated: true)
    }
}


class MyExtendedViewController: ExtendedViewController  {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        view.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1.0)
        view.backgroundColor = .white
        
//        self.transparentNavigationBar = Bool.random()
        self.hidesNavigationBar = Bool.random()
        self.transparentNavigationBar = Bool.random()
        self.hidesNavigationBarSeparator = Bool.random()
        
        print("hidesNavigationBar: \(hidesNavigationBar), transparentNavigationBar: \(transparentNavigationBar), hidesNavigationBarSeparator: \(hidesNavigationBarSeparator)")
        
//        switch navigationController!.viewControllers.count {
//        case 2:
//            break
//        case 3: // 隐藏导航栏
//            hidesNavigationBar = true
//        case 4: // 透明导航栏
//            hidesNavigationBar = false
//            transparentNavigationBar = true
//        case 5: // 显示导航栏，但是隐藏分割线
//            hidesNavigationBar = false
//            transparentNavigationBar = false
//            hidesNavigationBarSeparator = true
//        case 6: // 显示导航栏，显示自定义分割线
//            hidesNavigationBar = false
//            hidesNavigationBarSeparator = false
////            navigationBarSeparatorImage = currentBundle.image(named: "线")
//            view.backgroundColor = .white
//        default:
//            hidesNavigationBar = false
//            hidesNavigationBarSeparator = false
//            view.backgroundColor = .white
//            break
//        }
        
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
