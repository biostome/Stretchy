//
//  StretchyHeaderLayout.swift
//  Stretchy
//
//  Created by nathan on 2019/4/6.
//  Copyright © 2019年 nathan. All rights reserved.
//

import UIKit

class StretchyHeaderLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        attributes?.forEach({ (attribute) in
            if attribute.representedElementKind == UICollectionView.elementKindSectionHeader,attribute.indexPath.section == 0 {
                guard let collectionView = collectionView else {return}
                let contentOffsetY = collectionView.contentOffset.y
                if contentOffsetY > 0 {return}
                let height = attribute.frame.height - contentOffsetY
                let width = collectionView.frame.width
                attribute.frame = CGRect.init(x: 0, y: contentOffsetY, width: width, height: height)
            }
        })
        return attributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
