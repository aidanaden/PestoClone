//
//  PestoInkOverlay.swift
//  PestoClone
//
//  Created by Aidan Aden on 16/8/17.
//  Copyright © 2017 Aidan Aden. All rights reserved.
//

import UIKit
import MaterialComponents


class PestoInkOverlay: UIView, MDCInkTouchControllerDelegate {
    
    private var inkTouchController: MDCInkTouchController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        let cyan = UIColor(red: 22 / 255, green: 240 / 255, blue: 240 / 255, alpha: 0.2)
        let teal = UIColor.init(red: 0, green: 0.67, blue: 0.55, alpha: 0.15)
        self.inkTouchController = MDCInkTouchController(view: self)
        self.inkTouchController?.defaultInkView.inkColor = teal
        self.inkTouchController?.delegate = self
        self.inkTouchController?.addInkView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

