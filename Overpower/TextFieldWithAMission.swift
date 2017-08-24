//
//  TextFieldWithAMission.swift
//  OverPowered
//
//  Created by Bright Future on 18/03/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import UIKit

class TextFieldWithAMission: UITextField {
    
    var bottomLine = CALayer()
    
    var answerIdentifier: String!
    var regex: String!
    
    init(answerIdentifier: String, regex: String, target: UITextFieldDelegate, action: Selector) {
        self.answerIdentifier = answerIdentifier
        self.regex = regex
        super.init(frame: CGRect(x: 0, y: 0, width: 80, height: 40))
        
        keyboardType = .numbersAndPunctuation
        returnKeyType = .next
        useUnderLine()
        textColor = UIColor.white
        textAlignment = .center
        font = UIFont(name: "HelveticaNeue-Thin", size: 36)
        delegate = target
        addTarget(target, action: action, for: .editingDidEnd)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func useUnderLine() {
        
        self.borderStyle = .none
        self.layoutIfNeeded()
        
        let width = CGFloat(1.0)
        bottomLine.borderColor = UIColor.white.cgColor
        bottomLine.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: width)
        bottomLine.borderWidth = width
        
        self.layer.addSublayer(bottomLine)
        self.layer.masksToBounds = true
    }
}
