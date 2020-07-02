//
//  StringLayoutSizeExtensionViewController.swift
//  UIKitExtensionsExample
//
//  Created by 张鹏 on 2019/6/6.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import UIKit

class StringLayoutSizeExtensionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.edgesForExtendedLayout = []
        
        
        let attText: NSMutableAttributedString = NSMutableAttributedString(string: "如果我们试着对索引越界的数据进行检索或者设置新值的操作。如果我们试着对索引越界的数据进行检索或者设置新值的操作。如果我们试着对索引越界的数据进行检索或者设置新值的操作。如果我们试着对索引越界的数据进行检索或者设置新值的操作。如果我们试着对索引越界的数据进行检索或者设置新值的操作。如果我们试着对索引越界的数据进行检索或者设置新值的操作。如果我们试着对索引越界的数据进行检索或者设置新值的操作。222")
        
//        // 修改文字样式
//        attText.addStyle(color: .orange, font: UIFont.boldSystemFont(ofSize: 13), lineSpace: 10, wordSpace: 15, alignment: .center, at: NSRange(location: 0, length: attText.length))
//
//        // 添加图片
//        attText.append(image: UIImage(named: "test1")!, space: 5, rect: CGRect(x: 0, y: 0, width: 120, height: 150), at: NSRange(location: 10, length: 0))
//
//        attText.append(image: UIImage(named: "test2")!, space: 5, rect: CGRect(x: 0, y: 0, width: 90, height: 100), at: NSRange(location: 30, length: 0))
        
        let label: UILabel = UILabel()
        label.numberOfLines = 3
        label.backgroundColor = .blue
        label.attributedText = attText
        view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(attText.labelLayoutHeightThatFits(width: UIScreen.main.bounds.size.width, lines: 3))
        }
        
        // string layout size
        let text = "这是一个文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本"
        let textFont = UIFont.systemFont(ofSize: 30)
        
        let fixedSize = text.labelLayoutSizeThatFits(CGSize(width: view.bounds.width-40, height: CGFloat.greatestFiniteMagnitude), font: textFont)
//        Log.debug(fixedSize)
        
        let stringLayoutSizeLabel = UILabel(frame: CGRect(x: 20, y: 200, width: fixedSize.width, height: fixedSize.height))
        stringLayoutSizeLabel.font = textFont
        stringLayoutSizeLabel.text = text
        stringLayoutSizeLabel.numberOfLines = 0
        stringLayoutSizeLabel.backgroundColor = .cyan
        view.addSubview(stringLayoutSizeLabel)
        
        let attributedText = NSMutableAttributedString(string: "这是一个文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本")
        
        attributedText.addAttributes([
            .font: UIFont.systemFont(ofSize: 30, weight: .bold),
            .foregroundColor: UIColor.blue
            ], range: NSRange(location: 0, length: 6))
        attributedText.addAttributes([
            .font: UIFont.systemFont(ofSize: 60, weight: .light),
            .underlineStyle: NSNumber(value: NSUnderlineStyle.double.rawValue),
            .underlineColor: UIColor.red
            ], range: NSRange(location: 30, length: 3))
        
        let fixedSize2 = attributedText.labelLayoutSizeThatFits(CGSize(width: view.bounds.width-40, height: CGFloat.greatestFiniteMagnitude))
        
        let attributedStringLayoutSizeLabel = UILabel(frame: CGRect(x: 20, y: 200+fixedSize.height+30, width: fixedSize2.width, height: fixedSize2.height))
        attributedStringLayoutSizeLabel.attributedText = attributedText
        attributedStringLayoutSizeLabel.numberOfLines = 0
        attributedStringLayoutSizeLabel.backgroundColor = UIColor(white: 0.8, alpha: 1.0)
        view.addSubview(attributedStringLayoutSizeLabel)
        
        let attributedText3 = NSMutableAttributedString(string: "这是一个文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本")
        
        attributedText3.addAttributes([
            .font: UIFont.systemFont(ofSize: 30, weight: .bold),
            .foregroundColor: UIColor.blue
            ], range: NSRange(location: 0, length: 6))
        attributedText3.addAttributes([
            .font: UIFont.systemFont(ofSize: 60, weight: .light),
            .underlineStyle: NSNumber(value: NSUnderlineStyle.double.rawValue),
            .underlineColor: UIColor.red
            ], range: NSRange(location: 30, length: 3))
        
        let fixedSize3 = attributedText3.labelLayoutSizeThatFits(CGSize(width: view.bounds.width-40, height: CGFloat.greatestFiniteMagnitude), lines: 2)
        
        let attributedStringLayoutSizeLabel3 = UILabel(frame: CGRect(x: 20, y: 450+fixedSize2.height+30, width: fixedSize3.width, height: fixedSize3.height))
        attributedStringLayoutSizeLabel3.attributedText = attributedText3
        attributedStringLayoutSizeLabel3.numberOfLines = 2
        attributedStringLayoutSizeLabel3.backgroundColor = UIColor(white: 0.8, alpha: 1.0)
        view.addSubview(attributedStringLayoutSizeLabel3)
    }
}
