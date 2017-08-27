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
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return iv
    }()
    
    let bottomContainerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        return containerView
    }()
    
    let titleLbl: UILabel = {
        let title = UILabel()
        title.lineBreakMode = .byWordWrapping
        title.numberOfLines = 1
        title.font = MDCTypography.headlineFont().withSize(28)
        title.textColor = UIColor.init(white: 0, alpha: 0.87)
        title.alpha = MDCTypography.headlineFontOpacity()
        return title
    }()
    
    let descriptionTextView: UITextView = {
        let descTv = UITextView()
        descTv.font = MDCTypography.body1Font()
        descTv.alpha = MDCTypography.body1FontOpacity()
        return descTv
    }()
    
    let topContainerView: UIView = {
        let containerView = UIView()
        containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        return containerView
    }()
    
    lazy var backBtn: UIButton = {
        let backButton = UIButton()
        backButton.setImage(#imageLiteral(resourceName: "Back"), for: .normal)
        backButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        return backButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topContainerView.addSubview(imageView)
        topContainerView.addSubview(backBtn)
        
        bottomContainerView.addSubview(titleLbl)
        bottomContainerView.addSubview(descriptionTextView)
        
        view.addSubview(topContainerView)
        view.addSubview(bottomContainerView)
        
        isHeroEnabled = true
        heroModalAnimationType = .selectBy(presenting: .auto, dismissing: .uncover(direction: .down))
        
        backBtn.heroID = "Back"
        backBtn.heroModifiers = [.fade]
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        topContainerView.frame = CGRect(x: 0, y: 0, width: view.bounds.width + 50, height: view.bounds.height / 2 + 100)
        bottomContainerView.frame = CGRect(x: 0, y: topContainerView.frame.height, width: view.bounds.width, height: view.bounds.height - topContainerView.frame.height)
        
        imageView.frame = topContainerView.frame
        
        _ = backBtn.anchor(topContainerView.topAnchor, left: topContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 25, leftConstant: 5, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
//        titleLbl.frame = CGRect(x: 20, y: topContainerView.frame.height + 20, width: view.bounds.width, height: 44)
        _ = titleLbl.anchor(bottomContainerView.topAnchor, left: bottomContainerView.leftAnchor, bottom: nil, right: bottomContainerView.rightAnchor, topConstant: 10, leftConstant: 80, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 52)
        
        _ = descriptionTextView.anchor(titleLbl.bottomAnchor, left: bottomContainerView.leftAnchor, bottom: nil, right: bottomContainerView.rightAnchor, topConstant: 0, leftConstant: 78, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 100)
    }
    
    func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    func setupViews(image: UIImage, imageName: String, title: String, description: String, author: String) {
        
        let materialCurve = MDCAnimationTimingFunction.easeInOut
        let timingFunction = CAMediaTimingFunction.mdc_function(withType: materialCurve)
        
        imageView.image = image
        titleLbl.text = title
        descriptionTextView.text = description
        
        imageView.heroID = "\(imageName)_image"
        imageView.heroModifiers = [.duration(0.25), .delay(0), .timingFunction(timingFunction!
            )]
        
        bottomContainerView.heroID = "\(imageName)_BottomContent"
        bottomContainerView.heroModifiers = [.duration(0.25), .delay(0), .timingFunction(timingFunction!)]
        
        
//        titleLbl.heroID = "\(title)_lbl"
//        titleLbl.heroModifiers = [.duration(0.25), .delay(0), .zPosition(CGFloat(2))]
//        titleLbl.heroModifiers = [.zPosition(4)]
        
//        descriptionLbl.heroID = "\(author)_lbl"
//        descriptionLbl.heroModifiers = [.zPosition(4)]
    }
    
}




















