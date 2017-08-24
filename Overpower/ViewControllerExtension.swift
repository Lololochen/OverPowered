//
//  VCNavigationExtension.swift
//  Overpower
//
//  Created by Bright Future on 04/12/2016.
//  Copyright © 2016 Bright Future. All rights reserved.
//

import UIKit
import SafariServices

extension UIViewController {
    
    // MARK:- iPad navigation button
    
    internal func addButtonsForIpad() {
        if UIDevice.current.userInterfaceIdiom == .pad {
            
            let backButton = UIButton()
            backButton.setImageInButtonCenter(image: #imageLiteral(resourceName: "Back"), imageSize: 15)
            backButton.alpha = 0.9
            backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
            view.addSubview(backButton)
            
            backButton.translatesAutoresizingMaskIntoConstraints = false
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35).isActive = true
            backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
            backButton.widthAnchor.constraint(equalToConstant: 36).isActive = true
            backButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
            view.setNeedsLayout()
        }
    }
    
    @objc private func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK:- Present PopoverCollectionVC
    
    internal func presentPopoverCollectionVC(target: PopoverCollectionViewDelegate & UIViewControllerTransitioningDelegate , with dataSourceType: DataSourceType) {
        let VC = storyboard?.instantiateViewController(withIdentifier: "PopoverCollectionVC") as! PopoverCollectionVC
        VC.setDataSource(with: dataSourceType)
        VC.collectionView?.backgroundColor = UIColor.clear
        VC.delegate = target
        VC.transitioningDelegate = target
        self.present(VC, animated: true, completion: nil)
    }
}
