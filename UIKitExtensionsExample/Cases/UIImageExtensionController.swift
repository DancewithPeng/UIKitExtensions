//
//  UIImageExtensionController.swift
//  UIKitExtensionsExample
//
//  Created by 张鹏 on 2019/4/24.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import UIKit

class UIImageExtensionController: UIViewController {

    @IBOutlet weak var sourceImageView: UIImageView!
    @IBOutlet weak var changedImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 原图
        let sourceImage = #imageLiteral(resourceName: "test")
        sourceImageView.image = sourceImage
        
        // 调整后的图片
        let changedImage = sourceImage.resize(CGSize(width: 200, height: 100), mode: .scaleAspectFit)
        changedImageView.image = changedImage
    }
}
