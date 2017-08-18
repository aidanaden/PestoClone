//
//  PestoContentView.swift
//  PestoClone
//
//  Created by Aidan Aden on 16/8/17.
//  Copyright © 2017 Aidan Aden. All rights reserved.
//

import UIKit
import MaterialComponents


class PestoHeaderContentView: UIView {
    
    var bigLogo = UIImageView(image: #imageLiteral(resourceName: "PestoLogoLarge"))
    var smallLogo = UIImageView(image: UIImage(named: "00001"))
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.init(red: 0, green: 0.67, blue: 0.55, alpha: 1)
        
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(bigLogo)
        addSubview(smallLogo)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        bigLogo.center = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        smallLogo.center = CGPoint(x: frame.size.width/2, y: 44)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
















