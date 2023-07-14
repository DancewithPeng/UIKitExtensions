//
//  StringLayoutSizeExtensionViewController.swift
//  UIKitExtensionsExample
//
//  Created by DancewithPeng on 2019/6/6.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import UIKit

class StringLayoutSizeExtensionViewController: UIViewController {

    @IBOutlet weak var elementContainerView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.edgesForExtendedLayout = []
        
        
        let attText: NSMutableAttributedString = NSMutableAttributedString(string: "文字样式添>>>>如果我们试着对索引越界的数据进行检索或者设置新值的操作。如果我们试着对索引越界的数据进行检索或者设置新值的操作。如果我们试着对索引越界的数据进行检索或者设置新值的操作。如果我们试着对索引越界的数据进行检索或者设置新值的操作。如果我们试着对索引越界的数据进行检索或者设置新值的操作。如果我们试着对索引越界的数据进行检索或者设置新值的操作。如果我们试着对索引越界的数据进行检索或者设置新值的操作。222")
        
//        // 修改文字样式
        attText.addStyle(color: .orange,
                         font: UIFont.boldSystemFont(ofSize: 13),
                         lineSpace: 10,
                         wordSpace: 15,
                         alignment: .center,
                         at: NSRange(location: 0, length: attText.length))
//        attText.addStyle(font: UIFont.boldSystemFont(ofSize: 13), at: NSRange(location: 0, length: attText.length))
//
//        // 添加图片
//        attText.append(image: UIImage(named: "test")!, space: 5, rect: CGRect(x: 0, y: 0, width: 120, height: 150), at: NSRange(location: 10, length: 0))
//
//        attText.append(image: UIImage(named: "test2")!, space: 5, rect: CGRect(x: 0, y: 0, width: 90, height: 100), at: NSRange(location: 30, length: 0))
        
        let label: UILabel = UILabel()
        label.numberOfLines   = 3
        label.backgroundColor = .blue
        label.textColor       = .white
        label.attributedText  = attText
        label.lineBreakMode   = .byTruncatingTail
        
        let attTextHeight = attText.layoutHeightThatFits(width: UIScreen.main.bounds.size.width, lines: 3)
        Log.debug(attTextHeight)
        
        label.snp.makeConstraints { (make) in
            make.height.equalTo(attTextHeight)
        }
        
        elementContainerView.insertArrangedSubview(label, at: 0)
        
        // string layout size
        let text = "这是不限制行数文本文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 结束@"
        let textFont = UIFont.systemFont(ofSize: 30)

        let fixedSize = text.layoutSizeThatFits(size: CGSize(width: view.bounds.width-40,
                                                             height: CGFloat.greatestFiniteMagnitude),
                                                font: textFont)
        Log.debug(fixedSize)

        let stringLayoutSizeLabel = UILabel(frame: CGRect(x: 20, y: 100, width: fixedSize.width, height: fixedSize.height))
        stringLayoutSizeLabel.font = textFont
        stringLayoutSizeLabel.text = text
        stringLayoutSizeLabel.numberOfLines = 0
        stringLayoutSizeLabel.backgroundColor = .cyan
        stringLayoutSizeLabel.snp.makeConstraints { make in
            make.size.equalTo(fixedSize)
        }
        
        elementContainerView.insertArrangedSubview(stringLayoutSizeLabel, at: 1)

        let attributedText = NSMutableAttributedString(string: "这是一个不限行数文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 结束@")

        attributedText.addAttributes([
            .font: UIFont.systemFont(ofSize: 30, weight: .bold),
            .foregroundColor: UIColor.blue
            ], range: NSRange(location: 0, length: 6))
        attributedText.addAttributes([
            .font: UIFont.systemFont(ofSize: 60, weight: .light),
            .underlineStyle: NSNumber(value: NSUnderlineStyle.double.rawValue),
            .underlineColor: UIColor.red
            ], range: NSRange(location: 30, length: 3))

        let fixedSize2 = attributedText.layoutSizeThatFits(size: CGSize(width: view.bounds.width-40,
                                                                       height: CGFloat.greatestFiniteMagnitude))

        let attributedStringLayoutSizeLabel = UILabel(frame: CGRect(x: 20, y: 100+fixedSize.height+30, width: fixedSize2.width, height: fixedSize2.height))
        attributedStringLayoutSizeLabel.attributedText  = attributedText
        attributedStringLayoutSizeLabel.numberOfLines   = 0
        attributedStringLayoutSizeLabel.backgroundColor = UIColor(white: 0.8, alpha: 1.0)
                
        Log.debug(fixedSize2)
        Log.debug(attributedText.boundingRect(with: CGSize(width: view.bounds.width-40,
                                                           height: CGFloat.greatestFiniteMagnitude),
                                              options: [.usesFontLeading, .usesLineFragmentOrigin],
                                              context: nil))
        
        let size = attributedStringLayoutSizeLabel.sizeThatFits(CGSize(width: view.bounds.width-40,
                                                                       height: CGFloat.greatestFiniteMagnitude))
        Log.debug(size)
        
//        let ctSize = sizeWithCoreText(text: attributedText, maxSize: CGSize(width: view.bounds.width-40,
//                                                                            height: CGFloat.greatestFiniteMagnitude))
        let ctSize = SizeCalculator.calculateSize(for: attributedText, maxSize: CGSize(width: view.bounds.width-40,
                                                                                       height: CGFloat.greatestFiniteMagnitude))
        Log.debug(ctSize)

        
        attributedStringLayoutSizeLabel.snp.makeConstraints { make in
//            make.size.equalTo(fixedSize2)
            make.width.equalTo(view.bounds.width - 40)
        }
        
        elementContainerView.insertArrangedSubview(attributedStringLayoutSizeLabel, at: 2)

        let attributedText3 = NSMutableAttributedString(string: "这是一个两行文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 文本 结束@")

        attributedText3.addAttributes([
            .font: UIFont.systemFont(ofSize: 30, weight: .bold),
            .foregroundColor: UIColor.blue
            ], range: NSRange(location: 0, length: 6))
        attributedText3.addAttributes([
            .font: UIFont.systemFont(ofSize: 60, weight: .light),
            .underlineStyle: NSNumber(value: NSUnderlineStyle.double.rawValue),
            .underlineColor: UIColor.red
            ], range: NSRange(location: 30, length: 3))

        let fixedSize3 = attributedText3.layoutSizeThatFits(size: CGSize(width: view.bounds.width-40, height: CGFloat.greatestFiniteMagnitude), lines: 2)
        
        let attributedStringLayoutSizeLabel3 = UILabel(frame: CGRect(x: 20, y: 350+fixedSize2.height+60, width: fixedSize3.width, height: fixedSize3.height))
        attributedStringLayoutSizeLabel3.attributedText = attributedText3
        attributedStringLayoutSizeLabel3.numberOfLines = 2
        attributedStringLayoutSizeLabel3.backgroundColor = UIColor(white: 0.8, alpha: 1.0)
        
        attributedStringLayoutSizeLabel3.snp.makeConstraints { make in
            make.size.equalTo(fixedSize3)
        }
        
        elementContainerView.insertArrangedSubview(attributedStringLayoutSizeLabel3, at: 3)
    }
    
    func sizeWithCoreText(text: NSAttributedString, maxSize: CGSize) -> CGSize {
//        let framesetter = CTFramesetterCreateWithAttributedString(text as CFAttributedString)
//
//        let attributes = [
//            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
//            NSAttributedString.Key.foregroundColor: UIColor.black,
//            NSAttributedString.Key.paragraphStyle: NSParagraphStyle.default
//        ]
//        let attributedString = NSMutableAttributedString(string: "Hello, world!", attributes: attributes)

        let framesetter = CTFramesetterCreateWithAttributedString(text as CFAttributedString)
        let path = CGPath(rect: CGRect(x: 0, y: 0, width: maxSize.width, height: CGFloat.greatestFiniteMagnitude), transform: nil)
        let frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, text.length), path, nil)

        let lines = CTFrameGetLines(frame) as! [CTLine]
//        var lineOrigins = [CGPoint](repeating: .zero, count: lines.count)
        
        let lineCount = lines.count
        var origins = [CGPoint](repeating: .zero, count: lineCount)
        CTFrameGetLineOrigins(frame, CFRange(location: 0, length: 0), &origins)
                
//        CTFrameGetLineOrigins(frame, CFRangeMake(0, 0), &lineOrigins)
        Log.debug(origins)

        var lineHeight: CGFloat = 0
        var lineWidth: CGFloat = 0
        for line in lines {
            var ascent: CGFloat = 0
            var descent: CGFloat = 0
            var leading: CGFloat = 0
            lineWidth = max(CTLineGetTypographicBounds(line, &ascent, &descent, &leading), lineWidth)
            let bounds = CTLineGetBoundsWithOptions(line, [.useOpticalBounds])
            let height = (ascent + descent + leading)
            lineHeight += height
//            Log.debug(line)
            Log.debug(height)
            Log.debug(bounds)
        }

        return CGSize(width: ceil(lineWidth), height: ceil(lineHeight))
    }
}
