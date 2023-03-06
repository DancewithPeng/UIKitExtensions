//
//  DPLogCoordinator.swift
//  UIKitExtensionsExample-ObjC
//
//  Created by 张鹏 on 2023/3/6.
//  Copyright © 2023 dancewithpeng@gmail.com. All rights reserved.
//

import Foundation
import DPLog

@objc
class DPLogCoordinator: NSObject {
    
    @objc
    static func setupDPLog() {
        do {
            try DPLog.Collector.shared.register(
                    DPLog.ConsoleHandler(
                        id: "UIKitExtensionsExample.ConsoleHandler",
                        level: .verbose,
                        formatter: DPLog.PlainMessageFormatter()
                    )
                )
        } catch {
            print(error)
        }
    }

}
