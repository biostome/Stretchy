//
//  HeaderView.swift
//  Stretchy
//
//  Created by nathan on 2019/4/6.
//  Copyright © 2019年 nathan. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    let imageView:UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "bibi"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let cimageView:UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "ic_wechat_customer"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        imageView.fillSuperview()
        setupVisualEffectBlur()
        
        addSubview(cimageView)
        cimageView.center = center
    }
    
    var animator:UIViewPropertyAnimator!
    
    private func setupVisualEffectBlur(){
        animator = UIViewPropertyAnimator(duration: 3.0, curve: .easeInOut, animations: {
            let blurEffect = UIBlurEffect(style: .regular)
            let visualEffectView = UIVisualEffectView(effect: blurEffect)
            self.addSubview(visualEffectView)
            visualEffectView.fillSuperview()
            
            self.cimageView.transform = CGAffineTransform.init(scaleX: 3, y: 3)
        })
        animator.fractionComplete = 0
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

public extension UIView {
    public func fillSuperview() {
        guard let superview = self.superview else { return }
        translatesAutoresizingMaskIntoConstraints = superview.translatesAutoresizingMaskIntoConstraints
        if translatesAutoresizingMaskIntoConstraints {
            autoresizingMask = [.flexibleWidth, .flexibleHeight]
            frame = superview.bounds
        } else {
            topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
            bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
            leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
            rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
        }
    }
}
