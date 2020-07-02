//
//  UIColorExtensionController.swift
//  UIKitExtensionsExample
//
//  Created by 张鹏 on 2019/4/23.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import UIKit
import UIKitExtensions

class UIColorExtensionController: UIViewController {

    @IBOutlet weak var hexColorLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var gradientColorImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 16进制颜色表示
        hexColorLabel.textColor = UIColor(hex: 0xFF00FF)
        
        
        // 渐变颜色
        let colorArr = [UIColor(hex: 0xFFFFFF)!, UIColor(hex: 0xFF00FF, alpha: 0.8)!]
        
        // gradientLayer
//        let layer = colorArr.gradientLayer()
//        layer.frame = gradientColorImageView.bounds
//        gradientColorImageView.layer.addSublayer(layer)
        
        // gradientImage
//        let gradientImage = colorArr.gradientImage(size: gradientColorImageView.bounds.size)
//        gradientColorImageView.image = gradientImage
        
        // gradientColor
//        let gradientColor = colorArr.gradientColor(size: gradientColorImageView.bounds.size)
//        gradientColorImageView.backgroundColor = gradientColor
        
        let gradientColor = colorArr.gradientColor(size: gradientColorImageView.bounds.size) { (gradientLayer) -> CAGradientLayer in
            gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
            return gradientLayer
        }
        gradientColorImageView.backgroundColor = gradientColor
        
        
        // 颜色图片
        imageView.image = UIColor(hex: 0xFF00FF)?.image(with: CGSize(width: 150, height: 50))
    }
}
