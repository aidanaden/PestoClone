//
//  PestoCollectionViewController.swift
//  PestoClone
//
//  Created by Aidan Aden on 16/8/17.
//  Copyright © 2017 Aidan Aden. All rights reserved.
//

import UIKit
import MaterialComponents

class PestoCollectionViewController: UICollectionViewController {
    
    var headerViewController: MDCFlexibleHeaderViewController!
    let headerContentView = PestoHeaderContentView(frame: CGRect.zero)
    let kPestoAnimationDuration: CGFloat = 0.33
    var pestoData: PestoData!
    var logoScale: CGFloat?
    
    var zoomableView = UIImageView()
    var zoomableCardView = UIView()
    
    private let cellId = "PestoCollectionViewCellId"
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        self.pestoData = PestoData()
        zoomableView.frame = CGRect.zero
        zoomableCardView.frame = CGRect.zero
        
        self.collectionView?.backgroundColor = UIColor.init(white: 0.92, alpha: 1)
        self.collectionView?.register(PestoCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pestoData.titles.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PestoCollectionViewCell
        let imageFileName = pestoData.imageFileNames[indexPath.item]
        let title = pestoData.titles[indexPath.item]
        let author = pestoData.authors[indexPath.item]
        
        cell.populateCell(imageFileName: imageFileName, title: title, author: author)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        
        let cellWidth = self.view.frame.width - 24
        let cellHeight = cellWidth * 1
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! PestoCollectionViewCell
        let detailVC = PestoDetailViewController()
        let title = pestoData.titles[indexPath.item]
        let description = pestoData.descriptions[indexPath.item]
        guard let image = cell.imageView.image else { return }
        let imageName = pestoData.imageFileNames[indexPath.item]
        let author = pestoData.authors[indexPath.item]
        
        detailVC.setupViews(image: image, imageName: imageName, title: title, description: description, author: author)
        present(detailVC, animated: true, completion: nil)
    }
    
    func setupHeaderView() {
        
        let header = headerViewController.headerView
        header.backgroundColor = .white
        header.maximumHeight = 320
        header.minimumHeight = 72
        header.trackingScrollView = collectionView
        header.shadowLayer = CALayer()
        header.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        headerContentView.frame = header.frame
        headerContentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        header.addSubview(headerContentView)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        headerViewController.scrollViewDidScroll(scrollView)
        
        let scrollContentOffsetY = scrollView.contentOffset.y
        self.logoScale = scrollContentOffsetY / -((self.view.frame.width - 24)*1.1)
        print(self.logoScale)
        
        if self.logoScale! < CGFloat(0.5) {
//            self.logoScale = 0.5
            
            UIView.animate(withDuration: 0.25, animations: {
                self.headerContentView.bigLogo.layer.opacity = 0
                self.headerContentView.smallLogo.layer.opacity = 1
            })
            
        } else {
            
            UIView.animate(withDuration: 0.25, animations: {
                self.headerContentView.bigLogo.layer.opacity = 1
                self.headerContentView.smallLogo.layer.opacity = 0
            })
        }
        
        if self.logoScale! <= CGFloat(0.2) {
            self.logoScale = 0.2
        }
        
        let padding: CGFloat = 1 - 0.777000777000777
        self.headerContentView.bigLogo.transform = CGAffineTransform(scaleX: logoScale! + padding, y: logoScale! + padding)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        sizeHeaderView()
        collectionView?.collectionViewLayout.invalidateLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func willAnimateRotation(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        
        sizeHeaderView()
        collectionView?.collectionViewLayout.invalidateLayout()
    }
    
    func sizeHeaderView() {
        let headerView = headerViewController.headerView
        let bounds = UIScreen.main.bounds
        if bounds.size.width < bounds.size.height {
            headerView.maximumHeight = 300
        } else {
            headerView.maximumHeight = 72
        }
        headerView.minimumHeight = 72
    }
    
}









