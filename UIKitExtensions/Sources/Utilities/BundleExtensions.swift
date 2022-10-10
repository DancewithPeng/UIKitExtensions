//
//  BundleExtensions.swift
//  UIKitExtensions
//
//  Created by 张鹏 on 2022/10/10.
//  Copyright © 2022 dancewithpeng@gmail.com. All rights reserved.
//

import UIKit

protocol ModuleBundleProvider: AnyObject {
    static var moduleBundle: Bundle { get }
    var moduleBundle: Bundle { get }
}

extension ModuleBundleProvider {
    
    static var moduleBundle: Bundle {
        let targetBundle = Bundle(for: Self.self)
        let typeName = String(reflecting: self)
        let moduleName: String
        if let mName = typeName.components(separatedBy: ".").first {
            moduleName = mName
        } else {
            moduleName = typeName
        }
        
        guard let url = targetBundle.url(forResource: moduleName, withExtension: "bundle"),
              let resourceBundle = Bundle(url: url) else {
            return targetBundle
        }
        
        return resourceBundle
    }
    
    var moduleBundle: Bundle {
        Self.moduleBundle
    }
}

extension UIViewController: ModuleBundleProvider {}
extension UIView: ModuleBundleProvider {}
