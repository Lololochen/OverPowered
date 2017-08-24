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
