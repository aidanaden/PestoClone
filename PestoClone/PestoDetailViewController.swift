//
//  PestoDetailViewController.swift
//  PestoClone
//
//  Created by Aidan Aden on 17/8/17.
//  Copyright © 2017 Aidan Aden. All rights reserved.
//

import UIKit
import MaterialComponents
import Hero


class PestoDetailViewController: UIViewController {
    
    fileprivate let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return iv
    }()
    
    fileprivate let bottomContainerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        return containerView
    }()
    
    fileprivate let titleLbl: UILabel = {
        let title = UILabel()
        title.lineBreakMode = .byWordWrapping
        title.numberOfLines = 1
        title.font = MDCTypography.headlineFont()
        title.textColor = UIColor.init(white: 0, alpha: 0.87)
        title.alpha = MDCTypography.headlineFontOpacity()
        return title
    }()
    
    fileprivate let descriptionLbl: UILabel = {
        let descLabel = UILabel()
        descLabel.numberOfLines = 8
        descLabel.lineBreakMode = .byWordWrapping
        descLabel.font = MDCTypography.body1Font()
        descLabel.alpha = MDCTypography.body1FontOpacity()
        descLabel.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return descLabel
    }()
    
    fileprivate let topContainerView: UIView = {
        let containerView = UIView()
        containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        return containerView
    }()
    
    fileprivate lazy var backBtn: UIButton = {
        let backButton = UIButton()
        backButton.setTitle("Back", for: .normal)
        backButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        return backButton
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(topContainerView)
        view.addSubview(bottomContainerView)
        view.addSubview(titleLbl)
        view.addSubview(descriptionLbl)
        
        isHeroEnabled = true
        backBtn.heroID = "Back"
        backBtn.heroModifiers = [.fade]
        
//        _ = topContainerView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 300)
        
        topContainerView.addSubview(imageView)
        topContainerView.addSubview(backBtn)
        
        bottomContainerView.addSubview(titleLbl)
        bottomContainerView.addSubview(descriptionLbl)
        
//        _ = backBtn.anchor(topContainerView.topAnchor, left: topContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 15, leftConstant: 15, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
//        
//        imageView.frame = topContainerView.frame
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        topContainerView.frame = CGRect(x: 0, y: 0, width: view.bounds.width + 50, height: view.bounds.height / 2 + 100)
        imageView.frame = topContainerView.frame
        
        backBtn.frame = CGRect(x: 12, y: 12, width: 50, height: 50)
        
        bottomContainerView.frame = CGRect(x: 0, y: topContainerView.frame.height, width: view.bounds.width, height: view.bounds.height - topContainerView.frame.height)
    }
    
    func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    func setupViews(image: UIImage, imageName: String, title: String, description: String, author: String) {
        
        imageView.image = image
        imageView.heroID = "\(imageName)_image"
        imageView.heroModifiers = [.duration(0.25), .delay(0)]
//        titleLbl.text = title
//        titleLbl.heroID = "\(title)_lbl"
//        titleLbl.heroModifiers = [.zPosition(4)]
//        descriptionLbl.text = description
//        descriptionLbl.heroID = "\(author)_lbl"
//        descriptionLbl.heroModifiers = [.zPosition(4)]
    }
    
}




















