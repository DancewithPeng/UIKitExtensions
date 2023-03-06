//
//  LayoutSizeCalculator.swift
//  UIKitExtensions
//
//  Created by 张鹏 on 2023/3/6.
//  Copyright © 2023 dancewithpeng@gmail.com. All rights reserved.
//

import Foundation

protocol TextLayoutSizeCalculator {
    func calculateContentLayoutSize(maxSize: CGSize, lines: Int) -> CGSize
}
