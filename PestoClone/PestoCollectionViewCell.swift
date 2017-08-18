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
    
    fileprivate var cellContent = UIView()
    fileprivate var nameLbl = UILabel()
    fileprivate var creatorLbl = UILabel()
    fileprivate var pestoInkOverlay = PestoInkOverlay()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
//        let shadowLayer = layer as! MDCShadowLayer
//        shadowLayer.elevation = MDCShadowElevationCardResting
//        shadowLayer.isShadowMaskEnabled = false
        
        cellContent.frame = bounds
        cellContent.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        cellContent.backgroundColor = .white
        cellContent.clipsToBounds = true
        
        nameLbl.lineBreakMode = .byWordWrapping
        nameLbl.font = MDCTypography.headlineFont().withSize(26)
        nameLbl.numberOfLines = 1
        nameLbl.alpha = MDCTypography.titleFontOpacity()
        nameLbl.textColor = UIColor.init(white: 0, alpha: 0.87)
        cellContent.addSubview(nameLbl)
        
        creatorLbl.lineBreakMode = .byWordWrapping
        creatorLbl.numberOfLines = 1
        creatorLbl.font = MDCTypography.captionFont()
        creatorLbl.alpha = MDCTypography.captionFontOpacity()
        cellContent.addSubview(creatorLbl)
        
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        imageView.contentMode = .scaleAspectFill
        cellContent.addSubview(imageView)
        
        iconImageView.clipsToBounds = true
//        iconImageView.backgroundColor = .blue
        cellContent.addSubview(iconImageView)
        
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
        
        let avatarDim: CGFloat = 52
        iconImageView.frame = CGRect(x: 24, y: frame.height - avatarDim * 3/2 + 5, width: avatarDim, height: avatarDim)
        
        nameLbl.frame = CGRect(x: 88, y: frame.height - avatarDim * 3/2 + 5, width: frame.width - 88, height: 44)
        creatorLbl.frame = CGRect(x: 88, y: frame.height - 45, width: frame.width - 88, height: 44)
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
        
        let baseUrl = PestoData().pestoBaseUrl + imageFileName
        if let imageUrl = URL(string: baseUrl) {
            imageView.sd_setImage(with: imageUrl)
        }
        
        nameLbl.text = title
        creatorLbl.text = author
        
        imageView.heroID = "\(imageFileName)_image"
        imageView.heroModifiers = [.duration(0.1), .delay(0)]
//        nameLbl.heroID = "\(title)_lbl"
//        nameLbl.heroModifiers = [.zPosition(4)]
//        creatorLbl.heroID = "\(author)_lbl"
//        creatorLbl.heroModifiers = [.zPosition(4)]
    }

}

























