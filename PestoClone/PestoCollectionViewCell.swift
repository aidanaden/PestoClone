//
//  PestoCollectionViewCell.swift
//  PestoClone
//
//  Created by Aidan Aden on 16/8/17.
//  Copyright © 2017 Aidan Aden. All rights reserved.
//

import UIKit
import MaterialComponents
import SDWebImage
import Hero


class PestoCollectionViewCell: UICollectionViewCell {
    
    var imageView = UIImageView()
    var iconImageView = UIImageView()
    
    var cellContent = UIView()
    var nameLbl = UILabel()
    var creatorLbl = UILabel()
    var pestoInkOverlay = PestoInkOverlay()
    var bottomContentView = UIView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let shadowLayer = layer as! MDCShadowLayer
        shadowLayer.elevation = MDCShadowElevationCardResting
        shadowLayer.isShadowMaskEnabled = false
        
        cellContent.frame = bounds
        cellContent.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        cellContent.backgroundColor = .white
        cellContent.clipsToBounds = true
        
        bottomContentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        bottomContentView.backgroundColor = .white
        
        
        nameLbl.lineBreakMode = .byWordWrapping
        nameLbl.font = MDCTypography.headlineFont().withSize(26)
        nameLbl.numberOfLines = 1
        nameLbl.alpha = MDCTypography.titleFontOpacity()
        nameLbl.textColor = UIColor.init(white: 0, alpha: 0.87)
        bottomContentView.addSubview(nameLbl)
        
        creatorLbl.lineBreakMode = .byWordWrapping
        creatorLbl.numberOfLines = 1
        creatorLbl.font = MDCTypography.captionFont()
        creatorLbl.alpha = MDCTypography.captionFontOpacity()
        bottomContentView.addSubview(creatorLbl)
        
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        imageView.contentMode = .scaleAspectFill
        cellContent.addSubview(imageView)
        
        iconImageView.clipsToBounds = true
        iconImageView.backgroundColor = .white
        bottomContentView.addSubview(iconImageView)
        
        cellContent.addSubview(bottomContentView)
        
        pestoInkOverlay.frame = bounds
        pestoInkOverlay.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        cellContent.addSubview(pestoInkOverlay)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(cellContent)
        
        imageView.frame = CGRect(x: 0, y: 0, width: cellContent.frame.width, height: cellContent.frame.height * 3/4)
        
        bottomContentView.frame = CGRect(x: 0, y: imageView.frame.height, width: cellContent.frame.width, height: cellContent.frame.height - imageView.frame.height)
        
//        let avatarDim: CGFloat = 52
//        iconImageView.frame = CGRect(x: 24, y: frame.height - avatarDim * 3/2 + 5, width: avatarDim, height: avatarDim)
//        
//        nameLbl.frame = CGRect(x: 88, y: frame.height - avatarDim * 3/2 + 5, width: frame.width - 88, height: 44)
//        creatorLbl.frame = CGRect(x: 88, y: frame.height - 45, width: frame.width - 88, height: 44)
        _ = iconImageView.anchor(bottomContentView.topAnchor, left: bottomContentView.leftAnchor, bottom: nil, right: nil, topConstant: 15, leftConstant: 25, bottomConstant: 0, rightConstant: 0, widthConstant: 52, heightConstant: 52)
        _ = nameLbl.anchor(bottomContentView.topAnchor, left: iconImageView.rightAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 15, bottomConstant: 0, rightConstant: 0, widthConstant: self.frame.width, heightConstant: 44)
        _ = creatorLbl.anchor(nil, left: iconImageView.rightAnchor, bottom: bottomContentView.bottomAnchor, right: nil, topConstant: 0, leftConstant: 15, bottomConstant: 6, rightConstant: 0, widthConstant: nameLbl.frame.width, heightConstant: 44)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView.image = nil
        iconImageView.image = nil
    }

    override class var layerClass: AnyClass {
        get {
            return MDCShadowLayer.self
        }
    }
    
    func populateCell(imageFileName: String, title: String, author: String) {
        
        let materialCurve = MDCAnimationTimingFunction.easeInOut
        let timingFunction = CAMediaTimingFunction.mdc_function(withType: materialCurve)
        
        let baseUrl = PestoData().pestoBaseUrl + imageFileName
        if let imageUrl = URL(string: baseUrl) {
            imageView.sd_setImage(with: imageUrl)
        }
        
        nameLbl.text = title
        creatorLbl.text = author
        
        imageView.heroID = "\(imageFileName)_image"
        imageView.heroModifiers = [.duration(0.25), .delay(0), .timingFunction(timingFunction!)]
        
        bottomContentView.heroID = "\(imageFileName)_BottomContent"
        bottomContentView.heroModifiers = [.duration(0.25), .delay(0), .timingFunction(timingFunction!)]
        nameLbl.heroID = "\(title)_lbl"
        nameLbl.heroModifiers = [.duration(0.25), .delay(0), .fade, .useOptimizedSnapshot]
        creatorLbl.heroID = "\(author)_lbl"
        creatorLbl.heroModifiers = [.duration(0.25), .delay(0), .fade, .useOptimizedSnapshot]
    }

}

























