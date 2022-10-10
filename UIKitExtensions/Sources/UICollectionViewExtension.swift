//
//  UICollectionViewExtension.swift
//  UIKitExtensions
//
//  Created by 张鹏 on 2019/4/23.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import Foundation

// MARK: - Collection View 相关的便捷方法
public extension UICollectionView {
    
    /// 注册Cell
    ///
    /// - Parameter cellType: Cell的类型
    @objc
    func registerCell(_ cellType: UICollectionViewCell.Type) {
        let typeIdentifier = "\(cellType)"
        register(cellType, forCellWithReuseIdentifier: typeIdentifier)
    }
    
    /// 注册Nib Cell
    ///
    /// - Parameter cellType: Cell的类型
    @objc
    func registerNibCell(_ cellType: UICollectionViewCell.Type, in bundle: Bundle?) {
        let typeIdentifier = "\(cellType)"
        register(UINib.make(for: cellType, bundle: bundle), forCellWithReuseIdentifier: typeIdentifier)
    }
    
    /// 注册Nib Cell
    ///
    /// - Parameter cellType: Cell的类型
    @objc
    func registerNibCell(_ cellType: UICollectionViewCell.Type) {
        registerNibCell(cellType, in: nil)
    }
    
    /// 注册SupplementaryView
    ///
    /// - Parameters:
    ///   - supplementaryViewType: SupplementaryView的类型
    ///   - kind: SupplementaryView对应的kind
    @objc
    func registerSupplementaryView(_ supplementaryViewType: UICollectionReusableView.Type, forKind kind: String) {
        let typeIdentifier = "\(supplementaryViewType)"
        register(supplementaryViewType, forSupplementaryViewOfKind: kind, withReuseIdentifier: typeIdentifier)
    }
    
    /// 注册 Nib SupplementaryView
    ///
    /// - Parameters:
    ///   - supplementaryViewType: SupplementaryView的类型
    ///   - kind: SupplementaryView对应的kind
    @objc
    func registerNibSupplementaryView(_ supplementaryViewType: UICollectionReusableView.Type, forKind kind: String, in bundle: Bundle?) {
        let typeIdentifier = "\(supplementaryViewType)"
        register(UINib.make(for: supplementaryViewType, bundle: bundle), forSupplementaryViewOfKind: kind, withReuseIdentifier: typeIdentifier)
    }
    
    /// 注册 Nib SupplementaryView
    ///
    /// - Parameters:
    ///   - supplementaryViewType: SupplementaryView的类型
    ///   - kind: SupplementaryView对应的kind
    @objc
    func registerNibSupplementaryView(_ supplementaryViewType: UICollectionReusableView.Type, forKind kind: String) {
        registerNibSupplementaryView(supplementaryViewType, forKind: kind, in: nil)
    }
    
    /// 复用Cell
    ///
    /// - Parameter indexPath: 对应的indexPath
    /// - Returns: 返回对应类型的Cell
    func dequeueReusableCell<CellType: UICollectionViewCell>(for indexPath: IndexPath) -> CellType {
        let typeIdentifier = "\(CellType.self)"
        // swiftlint:disable force_cast
        return dequeueReusableCell(withReuseIdentifier: typeIdentifier, for: indexPath) as! CellType
    }
    
    /// 复用SupplementaryView
    ///
    /// - Parameters:
    ///   - kind: SupplementaryView对应的kind
    ///   - indexPath: 对应的indexPath
    /// - Returns: 返回对应类型的 SupplementaryView
    func dequeueReusableSupplementaryView<SupplementaryType>(ofKind kind: String, for indexPath: IndexPath) -> SupplementaryType {
        let typeIdentifier = "\(SupplementaryType.self)"
        // swiftlint:disable force_cast
        return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: typeIdentifier, for: indexPath) as! SupplementaryType
    }
}
