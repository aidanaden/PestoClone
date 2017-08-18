//
//  ViewController.swift
//  PestoClone
//
//  Created by Aidan Aden on 16/8/17.
//  Copyright © 2017 Aidan Aden. All rights reserved.
//

import UIKit
import MaterialComponents

class PestoFlexibleHeaderContainerViewController: MDCFlexibleHeaderContainerViewController{

    init() {
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        let collectionVC = PestoCollectionViewController(collectionViewLayout: layout)
        super.init(contentViewController: collectionVC)
        collectionVC.headerViewController = self.headerViewController
        collectionVC.setupHeaderView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}

