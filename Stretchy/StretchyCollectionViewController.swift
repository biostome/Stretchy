//
//  StretchyCollectionViewController.swift
//  Stretchy
//
//  Created by nathan on 2019/4/6.
//  Copyright © 2019年 nathan. All rights reserved.
//

import UIKit


class StretchyCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    private let cellID = "Cell"
    private let headerID = "headerID"
    private let padding:CGFloat = 16
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionLayout()
        
        setupCollectionView()
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        if contentOffsetY>0{return}
        header?.animator.fractionComplete = abs(contentOffsetY) / 100
    }
    
    var header: HeaderView?
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    fileprivate func setupCollectionView() {
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.backgroundColor = .red
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
    }
    
    fileprivate func setupCollectionLayout() {
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = .init(top: padding, left: padding
                , bottom: padding, right: padding)
            layout.minimumLineSpacing = 40
        }
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID, for: indexPath) as? HeaderView
        return header!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.init(width: view.frame.width, height: 240)
    }
 
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        cell.backgroundColor = .black
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: view.frame.width - 2 * padding, height: 50)
    }
    
}
