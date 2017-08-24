//
//  CustomTextField.swift
//  Overpower
//
//  Created by Bright Future on 15/09/2016.
//  Copyright © 2016 Bright Future. All rights reserved.
//

import UIKit

public extension UITextField {
    
    func useUnderLine() {
        self.borderStyle = .none
        self.layoutIfNeeded()
        
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.white.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: width)
        border.borderWidth = width
        
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
