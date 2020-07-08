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
    func registerNibCell(_ cellType: UICollectionViewCell.Type) {
        let typeIdentifier = "\(cellType)"
        register(UINib(nibName: typeIdentifier, bundle: Bundle(for: cellType)), forCellWithReuseIdentifier: typeIdentifier)
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
    func registerNibSupplementaryView(_ supplementaryViewType: UICollectionReusableView.Type, forKind kind: String) {
        let typeIdentifier = "\(supplementaryViewType)"
        register(UINib(nibName: typeIdentifier, bundle: Bundle(for: supplementaryViewType)), forSupplementaryViewOfKind: kind, withReuseIdentifier: typeIdentifier)
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
