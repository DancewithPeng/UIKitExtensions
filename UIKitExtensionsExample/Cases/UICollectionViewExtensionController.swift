//
//  UICollectionViewExtensionController.swift
//  UIKitExtensionsExample
//
//  Created by 张鹏 on 2019/4/24.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class UICollectionViewExtensionController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 注册Cell
        collectionView.registerCell(CustomCell.self)
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: CustomCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.backgroundColor = UIColor(red: CGFloat(arc4random()%256)/255.0, green: CGFloat(arc4random()%256)/255.0, blue: CGFloat(arc4random()%256)/255.0, alpha: 1.0)
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}

extension UICollectionViewExtensionController {
    
    class CustomCell: UICollectionViewCell {
        
        lazy var titleLabel = UILabel(frame: CGRect.zero)
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupSubviews()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupSubviews()
        }
        
        func setupSubviews() {
            titleLabel.text = "Custom Cell"
            contentView.addSubview(titleLabel)
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        }
    }
}
