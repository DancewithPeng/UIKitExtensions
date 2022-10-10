//
//  UIColorExtension.swift
//  UIKitExtensions
//
//  Created by DancewithPeng on 2019/4/16.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import UIKit

// MARK: - Convert to image
@objc
public extension UIColor {
    
    /// 生成对应颜色的图片
    @objc
    func image(with size: CGSize = CGSize(width: 1.0, height: 1.0)) -> UIImage {
        
        let rect = CGRect(origin: .zero, size: size)
        
        UIGraphicsBeginImageContext(rect.size)
        
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image!
    }
}

// MARK: - Hex Color
@objc
public extension UIColor {
    
    /// 根据16进制色值创建颜色对象的便捷方法
    ///
    /// - Parameters:
    ///   - hex: 16进制颜色值
    ///   - alpha: 不透明度
    /// - Returns: 返回对应16进制色值的颜色
    @objc
    convenience init?(hex: UInt, alpha: CGFloat = 1) {
        
        guard 0x000000...0xFFFFFF ~= hex else {
            return nil
        }
        
        let red     = CGFloat((hex & 0xFF0000) >> 16)   / 255.0
        let green   = CGFloat((hex & 0x00FF00) >> 8)    / 255.0
        let blue    = CGFloat((hex & 0x0000FF) >> 0)    / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /// 返回16进制色值对应的颜色
    ///
    /// - Parameters:
    ///   - hex: 16进制颜色值
    ///   - alpha: 不透明度
    /// - Returns: 返回对应16进制色值的颜色
    @objc(colorWithHex:alpha:)
    static func hex(_ hex: UInt, alpha: CGFloat = 1) -> UIColor? {
        return UIColor(hex: hex, alpha: alpha)
    }
}

// MARK: - Hex Color For Optional
public extension Optional where Wrapped: UIColor {
    
    /// 返回16进制色值对应的颜色
    /// - Parameters:
    ///   - hex: 16进制颜色值
    ///   - alpha: 不透明度
    /// - Returns: 返回对应16进制色值的颜色
    static func hex(_ hex: UInt, alpha: CGFloat = 1) -> UIColor? {
        return UIColor(hex: hex, alpha: alpha)
    }
}

// MARK: - Gradient Color
public extension Array where Element: UIColor {
    
    /// 根据颜色数组，创建一个对应的渐变颜色的CAGradientLayer
    ///
    /// - Parameter transform: 可以对CAGradientLayer设置的变化
    /// - Returns: 返回对应的CAGradientLayer对象
    func gradientLayer(_ transform: ((_ gradient: inout CAGradientLayer) -> CAGradientLayer)? = nil) -> CAGradientLayer {
        
        var gradientLayer = CAGradientLayer()
        gradientLayer.colors = self.map { $0.cgColor }
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        
        if let transform = transform {
            gradientLayer = transform(&gradientLayer)
        }
        
        return gradientLayer
    }
    
    /// 根据颜色数组，创建一个对应的渐变颜色的UIImage
    ///
    /// - Parameters:
    ///   - size: image的尺寸
    ///   - transform: 可以对CAGradientLayer设置的变化
    /// - Returns: 返回对应的UIImage对象
    func gradientImage(size: CGSize, transform: ((_ gradient: inout CAGradientLayer) -> CAGradientLayer)? = nil) -> UIImage? {
        
        let layer = gradientLayer(transform)
        layer.bounds = CGRect(origin: CGPoint.zero, size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        
        var image: UIImage?
        
        if let currentContext = UIGraphicsGetCurrentContext() {
            layer.render(in: currentContext)
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        
        UIGraphicsEndImageContext()
        
        return image
    }
    
    /// 根据颜色数组，创建一个对应的渐变颜色的UIColor
    ///
    /// - Parameters:
    ///   - size: 渐变颜色块对应的尺寸
    ///   - transform: 可以对CAGradientLayer设置的变化
    /// - Returns: 返回对应的UIColor对象
    func gradientColor(size: CGSize, transform: ((_ gradient: inout CAGradientLayer) -> CAGradientLayer)? = nil) -> UIColor {
        
        guard let image = gradientImage(size: size, transform: transform) else {
            return UIColor.white
        }
        
        return UIColor(patternImage: image)
    }
}
