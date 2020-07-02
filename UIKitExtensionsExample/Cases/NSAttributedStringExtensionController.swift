//
//  NSAttributedStringExtensionController.swift
//  UIKitExtensionsExample
//
//  Created by 张鹏 on 2020/7/2.
//  Copyright © 2020 dancewithpeng@gmail.com. All rights reserved.
//

import UIKit
import UIKitExtensions

class NSAttributedStringExtensionController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstText = """
                        如果我们试着对索引越界的数据进行检索或者设置新值的操作。如果我们试着对索引越界的数据进行检索或者设置新值的操作。如果我们试着对索引越界的数据进行检索或者设置新值的操作。222
                        """
        let firstAttributedString = NSMutableAttributedString(string: firstText)
        firstAttributedString.addStyle(color: .cyan,
                                       font: UIFont.systemFont(ofSize: 24, weight: .bold),
                                       lineSpace: 5,
                                       alignment: .center,
                                       at: NSMakeRange(0, firstText.count))
        textLabel.attributedText = firstAttributedString
        
        let secondText = """
                         近年来，微服务在应用开发和部署方面取得了显著的进步。将应用开发或重构成微服务以分离服务，通过 API 以明确的方式相互调用。比如，每个微服务都是自包含（self-contained），各自维护自己的数据存储，可以独立更新其他服务。

                         微服务使得应用程序开发变得更快更容易管理，它只需要较少的人力就能实现更多的功能，可以更快更容易地部署。将应用程序设计成一套微服务，它更加容易在多台有负载均衡的服务器上运行，而且能轻松应对需求高峰、由于时间推移而平稳增长的需求和由于硬件或者软件问题导致的宕机事故。
                         """
        self.textView.attributedText = secondText.attributedString(font: UIFont.systemFont(ofSize: 8, weight: .bold), color: .brown, minimumLineHeight: 30)
    }
}
