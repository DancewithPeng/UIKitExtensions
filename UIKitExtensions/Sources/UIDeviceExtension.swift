//
//  UIDeviceExtension.swift
//  UIKitExtensions
//
//  Created by 张鹏 on 2019/4/26.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import Foundation
import DPLog
import DPKeychain

// MARK: - Device Model
@objc
public extension UIDevice {
    
    /// 机型名字
    var modelName: String {
        
        // 已经存在，直接返回对应的机型名称
        if let modelNameAssociatedObject = objc_getAssociatedObject(self, &UIDevice.modelNameAssociatedObjectKey) as? String {
            return modelNameAssociatedObject
        }

        // 不存在的话去获取机型名称
        let fetchedModelName = fetchDeviceModelName()
        objc_setAssociatedObject(self, &UIDevice.modelNameAssociatedObjectKey, fetchedModelName, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        return fetchedModelName
    }
    
    /// 机型标识符
    var modelIdentifier: String {

        // 已经存在，直接返回对应的机型标识符
        if let modelIdentifierAssociatedObject = objc_getAssociatedObject(self, &UIDevice.modelIdentifierAssociatedObjectKey) as? String {
            return modelIdentifierAssociatedObject
        }

        // 不存在的话去获取机型标识符
        let fetchedModelIdentifier = fetchDeviceIdentifier()
        objc_setAssociatedObject(self, &UIDevice.modelIdentifierAssociatedObjectKey, fetchedModelIdentifier, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        return fetchedModelIdentifier
    }
    
    /// 获取机型名称
    ///
    /// - Returns: 返回机型名称
    func fetchDeviceModelName() -> String {
        
        guard let modelNameMaps = UIDevice.modelNameMaps else {
            return modelIdentifier
        }
        
        guard let modelName = modelNameMaps[modelIdentifier] else {
            return modelIdentifier
        }
        
        return modelName
    }
    
    /// 获取机型标识
    ///
    /// - Returns: 返回机型的唯一标识
    func fetchDeviceIdentifier() -> String {

        #if targetEnvironment(simulator)
        
        // 获取模拟器所对应的 model identifier
        if let identifier = ProcessInfo.processInfo.environment["SIMULATOR_MODEL_IDENTIFIER"] {
            return identifier
        }
        return "Unknown"
        
        #else
        
        // 真机对应的 model identifier
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
        
        #endif
    }
}

// MARK: - Device UUID
@objc
extension UIDevice {
    
    /// 持续化存储的UUID，可用作设备唯一ID
    public var persistentUUID: String {
        
        // 已经存在，直接返回对应的机型名称
        if let persistentUUIDAssociatedObject = objc_getAssociatedObject(self, &UIDevice.persistentUUIDAssociatedObjectKey) as? String {
            return persistentUUIDAssociatedObject
        }
        
        // 不存在的话去获取机型名称
        let fetchedPersistentUUID = UIDevice.fetchPersistentUUID()
        objc_setAssociatedObject(self, &UIDevice.persistentUUIDAssociatedObjectKey, fetchedPersistentUUID, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        return fetchedPersistentUUID
    }
    
    /// 获取持续化存储的UUID，可用作设备唯一ID
    private class func fetchPersistentUUID() -> String {
        
        if let uuid = UserDefaults.standard.string(forKey: deviceUUIDStorageKey) {
            return uuid
        }
        
        do {
            let passwordItems = try KeychainPasswordItem.passwordItems(forService: keychainServiceName, accessGroup: nil)
            if let deviceUUIDItem = passwordItems.first(where: { (item) -> Bool in
                return item.account == deviceUUIDStorageKey
            }) {
                return try deviceUUIDItem.readPassword()
            } else {
                
                let uuid: String = UUID().uuidString
                let deviceUUIDItem = KeychainPasswordItem(service: keychainServiceName, account: deviceUUIDStorageKey, accessGroup: nil)
                try deviceUUIDItem.savePassword(uuid)
                
                writeDefaults(uuid)
                
                return uuid
            }
        } catch {
            
            Log.error(error)
            
            let uuid: String = UUID().uuidString
            writeDefaults(uuid)
            
            let deviceUUIDItem = KeychainPasswordItem(service: keychainServiceName, account: deviceUUIDStorageKey, accessGroup: nil)
            try? deviceUUIDItem.savePassword(uuid)
            
            return uuid
        }
    }
    
    
    // MARK: - Helper Methods
    
    private class func writeDefaults(_ uuid: String) {
        UserDefaults.standard.set(uuid, forKey: deviceUUIDStorageKey)
        UserDefaults.standard.synchronize()
    }
}

// MARK: - Constants
extension UIDevice {
    
    /// 机型名称关联对象的key
    private static var modelNameAssociatedObjectKey = "UIDevice.modelNameAssociatedObjectKey"
    
    /// 机型标识符关联对象的key
    private static var modelIdentifierAssociatedObjectKey = "UIDevice.modelIdentifierAssociatedObjectKey"
    
    /// UUID关联对象的key
    private static var persistentUUIDAssociatedObjectKey = "UIDevice.persistentUUIDAssociatedObjectKey"
    
    /// 存储UUID对应的key
    private static let deviceUUIDStorageKey = "UIDevice.deviceUUIDStorageKey"
    
    /// 钥匙串服务名称
    private static let keychainServiceName = UIApplication.shared.bundleIdentifier
    
    
    /// 机型名称集合
    ///
    /// 参考地址：https://www.theiphonewiki.com/wiki/Models
    public static var modelNameMaps: [String: String]? {
        
        do {
            guard let url = Bundle(for: UIKitExtensions.self).url(forResource: "DeviceModelNameMaps", withExtension: "plist") else {
                throw ModelNameError.urlNotFound
            }
            
            let data = try Data(contentsOf: url)
            
            var format = PropertyListSerialization.PropertyListFormat.xml
            let result = try PropertyListDecoder().decode(Dictionary<String, String>.self, from: data, format: &format)
            
            return result
        } catch {
            Log.error("modelNameMaps Error: \(error)")
        }

        return nil
    }
    
    /// 机型名称错误类型
    ///
    /// - urlNotFound: 没找到URL
    enum ModelNameError: Error {
        case urlNotFound
    }
}
