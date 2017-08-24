//
//  UIButtonExtension.swift
//  Overpower
//
//  Created by Bright Future on 20/11/2016.
//  Copyright © 2016 Bright Future. All rights reserved.
//

import UIKit

extension UIButton {
    
    func highlightBackgroundColor() {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()!.setFillColor(UIColor.white.cgColor)
        UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0,
                                                   y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.setBackgroundImage(colorImage, for: .highlighted)
    }
    
    func setImageInButtonCenter(image: UIImage, imageSize: CGFloat) {
        let image = image
        self.setImage(image, for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: (self.frame.height - imageSize) / 2, left: (self.frame.width - imageSize) / 2, bottom: (self.frame.height - imageSize) / 2, right: (self.frame.width - imageSize) / 2)
        self.imageView?.contentMode = .scaleAspectFit
    }
}
