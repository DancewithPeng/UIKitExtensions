//
//  NibExtensions.swift
//  UIKitExtensions
//
//  Created by 张鹏 on 2022/10/10.
//  Copyright © 2022 dancewithpeng@gmail.com. All rights reserved.
//

import UIKit

extension UINib {
    
    static func make(for type: UIView.Type, bundle: Bundle?) -> UINib {
        let (typeModuleBundle, typeName) = bundleAndTypeName(for: type)
        return UINib(nibName: typeName, bundle: typeModuleBundle)
    }
    
    static func make(for type: UIViewController.Type, bundle: Bundle?) -> UINib {
        let (typeModuleBundle, typeName) = bundleAndTypeName(for: type)
        return UINib(nibName: typeName, bundle: typeModuleBundle)
    }
}

extension UINib {

    private static func bundleAndTypeName(for type: Any.Type) -> (Bundle, String) {
        let targetBundle: Bundle
        if let viewType = type as? UIView.Type {
            targetBundle = viewType.moduleBundle
        } else if let viewControllerType = type as? UIViewController.Type {
            targetBundle = viewControllerType.moduleBundle
        } else {
            targetBundle = .main
        }
        
        let typeIdentifier = String(reflecting: type)
        let typeName: String
        if let tName = typeIdentifier.components(separatedBy: ".").last {
            typeName = tName
        } else {
            typeName = typeIdentifier
        }
        
        return (targetBundle, typeName)
    }
}
