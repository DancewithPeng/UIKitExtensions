//
//  UIApplicationExtension.swift
//  UIKitExtensions
//
//  Created by 张鹏 on 2019/4/26.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import UIKit

// MARK: - UIApplication Infos
@objc
public extension UIApplication {
    
    /// 包ID
    var bundleIdentifier: String {
        
        // 已经存在，直接返回对应的bundleIdentifier
        if let bundleIdentifierAssociatedObject = objc_getAssociatedObject(self, &UIApplication.bundleIdentifierAssociatedObjectKey) as? String {
            return bundleIdentifierAssociatedObject
        }
        
        // 不存在的话去获取bundleIdentifier
        guard let fetchedBundleIdentifier = infos?[UIApplication.InfoDictionaryKey.bundleIdentifier] as? String else {
            return "Unknown"
        }
        
        objc_setAssociatedObject(self, &UIApplication.bundleIdentifierAssociatedObjectKey, fetchedBundleIdentifier, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        return fetchedBundleIdentifier
    }
    
    /// 包名
    var bundleDisplayName: String {
        
        // 已经存在，直接返回对应的bundleDisplayName
        if let bundleDisplayNameAssociatedObject = objc_getAssociatedObject(self, &UIApplication.bundleDisplayNameAssociatedObjectKey) as? String {
            return bundleDisplayNameAssociatedObject
        }
        
        // 不存在的话去获取bundleDisplayName
        var fetchedBundleDisplayName = "Unknown"
        if let bundleDisplayName = infos?[UIApplication.InfoDictionaryKey.bundleDisplayName] as? String {
            fetchedBundleDisplayName = bundleDisplayName
        } else if let bundleName = infos?[UIApplication.InfoDictionaryKey.bundleName] as? String {
            fetchedBundleDisplayName = bundleName
        }
        
        objc_setAssociatedObject(self, &UIApplication.bundleDisplayNameAssociatedObjectKey, fetchedBundleDisplayName, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        return fetchedBundleDisplayName
    }
    
    /// 包版本
    var bundleVersion: String {
        
        // 已经存在，直接返回对应的bundleDisplayName
        if let bundleVersionAssociatedObject = objc_getAssociatedObject(self, &UIApplication.bundleVersionAssociatedObjectKey) as? String {
            return bundleVersionAssociatedObject
        }
        
        // 不存在的话去获取bundleDisplayName
        guard let fetchedBundleVersion = infos?[UIApplication.InfoDictionaryKey.bundleShortVersionString] as? String else {
            return "Unknown"
        }
        
        objc_setAssociatedObject(self, &UIApplication.bundleVersionAssociatedObjectKey, fetchedBundleVersion, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        return fetchedBundleVersion
    }
    
    /// Info.plist中的信息
    var infos: [String: Any]? {
        return Bundle.main.infoDictionary
    }
}


// MARK: - Types
public extension UIApplication {
    
    /// InfoDictionary中对应的key
    enum InfoDictionaryKey: String {
        case bundleNumericVersion = "CFBundleNumericVersion"
        case buildMachineOSBuild = "BuildMachineOSBuild"
        case platformBuild = "DTPlatformBuild"
        case sdkName = "DTSDKName"
        case supportedInterfaceOrientations = "UISupportedInterfaceOrientations"
        case bundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
        case deviceFamily = "UIDeviceFamily"
        case bundleIdentifier = "CFBundleIdentifier"
        case compiler = "DTCompiler"
        case bundlePackageType = "CFBundlePackageType"
        case xcode = "DTXcode"
        case platformVersion = "DTPlatformVersion"
        case bundleExecutable = "CFBundleExecutable"
        case launchStoryboardName = "UILaunchStoryboardName"
        case bundleShortVersionString = "CFBundleShortVersionString"
        case bundleVersion = "CFBundleVersion"
        case viewControllerBasedStatusBarAppearance = "UIViewControllerBasedStatusBarAppearance"
        case xcodeBuild = "DTXcodeBuild"
        case bundleDevelopmentRegion = "CFBundleDevelopmentRegion"
        case sdkBuild = "DTSDKBuild"
        case bundleName = "CFBundleName"
        case bundleDisplayName = "CFBundleDisplayName"
        case bundleSupportedPlatforms = "CFBundleSupportedPlatforms"
        case requiredDeviceCapabilities = "UIRequiredDeviceCapabilities"
        case mainStoryboardFile = "UIMainStoryboardFile"
        case platformName = "DTPlatformName"
        case requiresIPhoneOS = "LSRequiresIPhoneOS"
        case minimumOSVersion = "MinimumOSVersion"
    }
}

// MARK: - InfoDictionaryKey subscript
public extension Dictionary where Key == String, Value == Any {
    
    /// InfoDictionaryKey类型的下标
    subscript(key: UIApplication.InfoDictionaryKey) -> Value? {
        return self[key.rawValue]
    }
}


// MARK: - Constants
private extension UIApplication {
    
    /// bundleIdentifier关联对象的key
    private static var bundleIdentifierAssociatedObjectKey = "UIDevice.bundleIdentifierAssociatedObjectKey"
    
    /// bundleDisplayName关联对象的key
    private static var bundleDisplayNameAssociatedObjectKey = "UIDevice.bundleDisplayNameAssociatedObjectKey"
    
    /// bundleVersio关联对象的key
    private static var bundleVersionAssociatedObjectKey = "bundleVersionAssociatedObjectKey"
}
