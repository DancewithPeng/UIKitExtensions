//
//  PlaceholderLayoutGuide.swift
//  UIKitExtensions
//
//  Created by DancewithPeng on 2019/6/12.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import Foundation

/// 占位的安全区域指南
internal class PlaceholderLayoutGuide: UILayoutGuide {
    
    override open var leadingAnchor: NSLayoutXAxisAnchor {
        return owningView?.leadingAnchor ?? NSLayoutXAxisAnchor()
    }
    
    override open var trailingAnchor: NSLayoutXAxisAnchor {
        return owningView?.trailingAnchor ?? NSLayoutXAxisAnchor()
    }
    
    override open var leftAnchor: NSLayoutXAxisAnchor {
        return owningView?.leftAnchor ?? NSLayoutXAxisAnchor()
    }
    
    override open var rightAnchor: NSLayoutXAxisAnchor {
        return owningView?.rightAnchor ?? NSLayoutXAxisAnchor()
    }
    
    override open var topAnchor: NSLayoutYAxisAnchor {
        return owningView?.topAnchor ?? NSLayoutYAxisAnchor()
    }
    
    override open var bottomAnchor: NSLayoutYAxisAnchor {
        return owningView?.bottomAnchor ?? NSLayoutYAxisAnchor()
    }
    
    override open var widthAnchor: NSLayoutDimension {
        return owningView?.widthAnchor ?? NSLayoutDimension()
    }
    
    override open var heightAnchor: NSLayoutDimension {
        return owningView?.heightAnchor ?? NSLayoutDimension()
    }
    
    override open var centerXAnchor: NSLayoutXAxisAnchor {
        return owningView?.centerXAnchor ?? NSLayoutXAxisAnchor()
    }
    
    override open var centerYAnchor: NSLayoutYAxisAnchor {
        return owningView?.centerYAnchor ?? NSLayoutYAxisAnchor()
    }
    
    public override init() {
        super.init()
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        identifier = "PlaceholderLayoutGuide"
    }
}
