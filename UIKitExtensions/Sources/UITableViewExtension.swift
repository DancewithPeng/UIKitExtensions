//
//  UITableViewExtension.swift
//  UIKitExtensions
//
//  Created by DancewithPeng on 2019/4/23.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import Foundation

// MARK: - Table View 相关的便捷方法
public extension UITableView {
    
    /// 注册Cell
    ///
    /// - Parameter cellType: Cell的类型
    @objc
    func registerCell(_ cellType: UITableViewCell.Type) {
        let typeIdentifier = String(reflecting: cellType)
        register(cellType, forCellReuseIdentifier: typeIdentifier)
    }
    
    /// 注册Nib Cell
    ///
    /// - Parameter cellType: Cell的类型
    @objc
    func registerNibCell(_ cellType: UITableViewCell.Type, in bundle: Bundle?) {
        let typeIdentifier = String(reflecting: cellType)
        register(UINib.make(for: cellType, bundle: bundle), forCellReuseIdentifier: typeIdentifier)
    }
    
    /// 注册Nib Cell
    ///
    /// - Parameter cellType: Cell的类型
    @objc
    func registerNibCell(_ cellType: UITableViewCell.Type) {
        registerNibCell(cellType, in: nil)
    }
    
    /// 复用Cell
    ///
    /// - Parameter indexPath: 对应的indexPath
    /// - Returns: 返回对应类型的Cell
    func dequeueReusableCell<CellType: UITableViewCell>(for indexPath: IndexPath) -> CellType {
        let typeIdentifier = String(reflecting: CellType.self)
        // swiftlint:disable force_cast
        return dequeueReusableCell(withIdentifier: typeIdentifier, for: indexPath) as! CellType
    }
    
    /// 注册Section头部或尾部
    ///
    /// - Parameter sectionHeaderFooterType: section头部或尾部的类型
    @objc
    func registerSectionHeaderFooter(_ sectionHeaderFooterType: UITableViewHeaderFooterView.Type) {
        let typeIdentifier = String(reflecting: sectionHeaderFooterType)
        register(sectionHeaderFooterType, forHeaderFooterViewReuseIdentifier: typeIdentifier)
    }
    
    /// 注册Section头部或尾部
    ///
    /// - Parameter sectionHeaderFooterType: section头部或尾部的类型
    @objc
    func registerNibSectionHeaderFooter(_ sectionHeaderFooterType: UITableViewHeaderFooterView.Type, in bundle: Bundle?) {
        let typeIdentifier = String(reflecting: sectionHeaderFooterType)
        register(UINib.make(for: sectionHeaderFooterType, bundle: bundle), forHeaderFooterViewReuseIdentifier: typeIdentifier)
    }
    
    /// 注册Section头部或尾部
    ///
    /// - Parameter sectionHeaderFooterType: section头部或尾部的类型
    @objc
    func registerNibSectionHeaderFooter(_ sectionHeaderFooterType: UITableViewHeaderFooterView.Type) {
        registerNibSectionHeaderFooter(sectionHeaderFooterType, in: nil)
    }
    
    /// 复用Section头部或尾部
    ///
    /// - Parameter indexPath: 对应的indexPath
    /// - Returns: 返回对应类型的Cell
    func dequeueReusableSectionHeaderFooter<HeaderFooterType: UITableViewHeaderFooterView>() -> HeaderFooterType {
        let typeIdentifier = String(reflecting: HeaderFooterType.self)
        // swiftlint:disable force_cast
        return dequeueReusableHeaderFooterView(withIdentifier: typeIdentifier) as! HeaderFooterType
    }
}


// MARK: - TableHeaderView包装的View

/// TableHeaderView包装的View
@objc
public class UITableHeaderWapperView: UIView {
    
    public init(contentView: UIView, height: CGFloat) {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: height))
        
        addSubview(contentView)

        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
