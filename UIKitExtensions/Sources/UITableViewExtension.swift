//
//  UITableViewExtension.swift
//  UIKitExtensions
//
//  Created by 张鹏 on 2019/4/23.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import Foundation

// MARK: - Table View 相关的便捷方法
public extension UITableView {
    
    /// 注册Cell
    ///
    /// - Parameter cellType: Cell的类型
    func registerCell(_ cellType: UITableViewCell.Type) {
        let typeIdentifier = "\(cellType)"
        register(cellType, forCellReuseIdentifier: typeIdentifier)
    }
    
    /// 注册Nib Cell
    ///
    /// - Parameter cellType: Cell的类型
    func registerNibCell(_ cellType: UITableViewCell.Type) {
        let typeIdentifier = "\(cellType)"
        register(UINib(nibName: typeIdentifier, bundle: Bundle(for: cellType)), forCellReuseIdentifier: typeIdentifier)
    }
    
    /// 复用Cell
    ///
    /// - Parameter indexPath: 对应的indexPath
    /// - Returns: 返回对应类型的Cell
    func dequeueReusableCell<CellType: UITableViewCell>(for indexPath: IndexPath) -> CellType {
        let typeIdentifier = "\(CellType.self)"
        // swiftlint:disable force_cast
        return dequeueReusableCell(withIdentifier: typeIdentifier, for: indexPath) as! CellType
    }
    
    /// 注册Section头部或尾部
    ///
    /// - Parameter sectionHeaderFooterType: section头部或尾部的类型
    func registerSectionHeaderFooter(_ sectionHeaderFooterType: UITableViewHeaderFooterView.Type) {
        let typeIdentifier = "\(sectionHeaderFooterType)"
        register(sectionHeaderFooterType, forHeaderFooterViewReuseIdentifier: typeIdentifier)
    }
    
    /// 注册Section头部或尾部
    ///
    /// - Parameter sectionHeaderFooterType: section头部或尾部的类型
    func registerNibSectionHeaderFooter(_ sectionHeaderFooterType: UITableViewHeaderFooterView.Type) {
        let typeIdentifier = "\(sectionHeaderFooterType)"
        register(UINib(nibName: typeIdentifier, bundle: Bundle(for: sectionHeaderFooterType)), forHeaderFooterViewReuseIdentifier: typeIdentifier)
    }
    
    /// 复用Section头部或尾部
    ///
    /// - Parameter indexPath: 对应的indexPath
    /// - Returns: 返回对应类型的Cell
    func dequeueReusableSectionHeaderFooter<HeaderFooterType: UITableViewHeaderFooterView>() -> HeaderFooterType {
        let typeIdentifier = "\(HeaderFooterType.self)"
        // swiftlint:disable force_cast
        return dequeueReusableHeaderFooterView(withIdentifier: typeIdentifier) as! HeaderFooterType
    }
}


// MARK: - TableHeaderView包装的View

/// TableHeaderView包装的View
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
