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
        
    lazy var scrollView = UIScrollView(frame: .zero)
    lazy var contentView = UIView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1.0)
        contentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 2)
        
        scrollView.addSubview(contentView)
        scrollView.contentSize = contentView.frame.size
        scrollView.contentInsetAdjustmentBehavior = .never
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive     = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive       = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive   = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        self.hidesNavigationBar = Bool.random()
        self.transparentNavigationBar = Bool.random()
        self.hidesNavigationBarSeparator = Bool.random()
        
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
        
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.textColor = isLightColor(contentView.backgroundColor!) ? .darkText : .lightText
        label.text = """
                     hidesNavigationBar: \(hidesNavigationBar)
                     transparentNavigationBar: \(transparentNavigationBar)
                     hidesNavigationBarSeparator: \(hidesNavigationBarSeparator)
                     """
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: pushedBtn.bottomAnchor, constant: 30).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        

    }
    
    @objc
    func pushedBtnDidClick(_ sender: Any) {
        navigationController?.pushViewController(MyExtendedViewController(), animated: true)
    }
    
    @objc
    func backBtnDidClick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func isLightColor(_ color: UIColor) -> Bool {
        var brightness: CGFloat = 0
        color.getHue(nil, saturation: nil, brightness: &brightness, alpha: nil)
        if brightness > 0.5 {
            return true
        } else {
            return false
        }
    }
}
