//
//  File.swift
//  OverPowered
//
//  Created by Bright Future on 27/12/2016.
//  Copyright © 2016 Bright Future. All rights reserved.
//

import UIKit

extension UIImage {
    
    func convertToGrayScale() -> UIImage {
        let filter: CIFilter = CIFilter(name: "CIPhotoEffectMono")!
        filter.setDefaults()
        filter.setValue(CoreImage.CIImage(image: self)!, forKey: kCIInputImageKey)
        
        return UIImage(cgImage: CIContext(options:nil).createCGImage(filter.outputImage!, from: filter.outputImage!.extent)!)
    }
}

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
    
    func setBorderOutline(_ color: CGColor) {
        self.layer.borderWidth = 1
        self.layer.borderColor = color
        self.layer.cornerRadius = self.frame.height / 8
    }
}

