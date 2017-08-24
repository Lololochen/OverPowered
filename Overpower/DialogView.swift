//
//  DialogView.swift
//  OverPowered
//
//  Created by Bright Future on 15/03/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import UIKit

class DialogView: UIView {

    var questionView: UILabel?
    var answerView: UIView!
    var superViewWidth: CGFloat! {
        didSet {
            sizeView()
        }
    }
    static var cellWidthOnIpad: CGFloat = 400
    
    init(superViewWidth: CGFloat, questionView: UILabel?, answerView: UIView) {
        
        self.questionView = questionView
        self.answerView = answerView
        self.superViewWidth = superViewWidth
        super.init(frame: CGRect.zero)
        
        sizeView()
        setSubviewFrame()
        layer.cornerRadius = 16
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func sizeView() {
        
        var width: CGFloat = 0
        var height: CGFloat = 0
        
        if traitCollection.horizontalSizeClass == .unspecified {
            width = superViewWidth - 20
        } else if traitCollection.horizontalSizeClass == .compact {
            width = superViewWidth - 20
        } else {
            width = DialogView.cellWidthOnIpad
        }
        
        if let questionViewHeight = questionView?.frame.height {
            height = (questionViewHeight + answerView.frame.height) + 90
        } else {
            height = answerView.frame.height + 40
        }
        
        bounds.size = CGSize(width: width, height: height)
        questionView?.adjustsFontSizeToFitWidth = true
        
    }
    
    func setSubviewFrame() {
        if questionView != nil {
            addSubview(questionView!)
            questionView!.center.x = bounds.midX
            questionView!.frame.origin.y = 25
            
            addSubview(answerView)
            answerView.center.x = bounds.midX
            answerView.frame.origin.y = frame.height - answerView.frame.size.height - 30
        } else {
            addSubview(answerView)
            answerView.center = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        }
    }
    
//    func matchColor() {
//        switch color! {
//        case .blue:
//            backgroundColor = UIColor(red: 43/255, green: 120/255, blue: 165/255, alpha: 1)
//        case .white:
//            backgroundColor = UIColor.white
//            layer.borderColor = UIColor(red: 43/255, green: 120/255, blue: 165/255, alpha: 1).cgColor
//            layer.borderWidth = 3
//            questionView?.textColor  = UIColor.black
//        case .black:
//            backgroundColor = UIColor(red: 55/255, green: 55/255, blue: 55/255, alpha: 1)
//        }
//    }
    
    func addShadows() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 5
    }
    
    static func createQuestion(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        label.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        label.textColor = UIColor.white
        label.textAlignment = .center
        
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let size = CGSize(width: 280, height: 1000)
        let estimatedFrame = NSString(string: text).boundingRect(with: size, options: options, attributes: [NSFontAttributeName: label.font!], context: nil)
        label.frame = CGRect(x: 0, y: 0, width: estimatedFrame.width + 10, height: estimatedFrame.height + 10)
        
        return label
    }
}
