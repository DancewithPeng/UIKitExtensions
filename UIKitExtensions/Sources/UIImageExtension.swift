//
//  UIImageExtension.swift
//  UIKitExtensions
//
//  Created by 张鹏 on 2019/4/23.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import Foundation
import Accelerate

// MARK: - Image Resize
@objc
public extension UIImage {
    
    /// 调整图片分辨率
    ///
    /// - Parameters:
    ///   - newSize: 新的尺寸
    ///   - mode: 图片缩放模式
    /// - Returns: 返回对应的图片
    func resize(_ newSize: CGSize, mode: UIView.ContentMode = .scaleToFill) -> UIImage? {
        
        var destSize = newSize
        let ratio = self.size.width / self.size.height
        let destRatio = newSize.width / newSize.height
        
        switch mode {
        case .scaleAspectFit:
            if ratio > destRatio {
                destSize.height = destSize.width / ratio
            } else {
                destSize.width = destSize.height * ratio
            }
        case .scaleAspectFill:
            if ratio > destRatio {
                destSize.width = destSize.height * ratio
            } else {
                destSize.height = destSize.width / ratio
            }
        default: break
        }
        
        guard let cgImage = self.cgImage else { return nil }
        
        var format = vImage_CGImageFormat(bitsPerComponent: 8, bitsPerPixel: 32, colorSpace: nil,
                                          bitmapInfo: CGBitmapInfo(rawValue: CGImageAlphaInfo.first.rawValue),
                                          version: 0, decode: nil, renderingIntent: CGColorRenderingIntent.defaultIntent)
        var sourceBuffer = vImage_Buffer()
        defer {
            sourceBuffer.data.deallocate()
        }
        
        var error = vImageBuffer_InitWithCGImage(&sourceBuffer, &format, nil, cgImage, numericCast(kvImageNoFlags))
        guard error == kvImageNoError else { return nil }
        
        // create a destination buffer
//        let scale = self.scale
        let destWidth = Int(destSize.width)
        let destHeight = Int(destSize.height)
        let bytesPerPixel = cgImage.bitsPerPixel / 8
        let destBytesPerRow = destWidth * bytesPerPixel
        let destData = UnsafeMutablePointer<UInt8>.allocate(capacity: destHeight * destBytesPerRow)
        defer {
            destData.deallocate()
        }
        var destBuffer = vImage_Buffer(data: destData, height: vImagePixelCount(destHeight), width: vImagePixelCount(destWidth), rowBytes: destBytesPerRow)
        
        // scale the image
        error = vImageScale_ARGB8888(&sourceBuffer, &destBuffer, nil, numericCast(kvImageHighQualityResampling))
        guard error == kvImageNoError else { return nil }
        
        // create a CGImage from vImage_Buffer
        let destCGImage = vImageCreateCGImageFromBuffer(&destBuffer, &format, nil, nil, numericCast(kvImageNoFlags), &error)?.takeRetainedValue()
        guard error == kvImageNoError else { return nil }
        
        // create a UIImage
        let resizedImage = destCGImage.flatMap { UIImage(cgImage: $0, scale: 0.0, orientation: self.imageOrientation) }
        return resizedImage
    }
}
