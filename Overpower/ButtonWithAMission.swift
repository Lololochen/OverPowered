//
//  ButtonWithAMission.swift
//  OverPowered
//
//  Created by Bright Future on 18/03/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import UIKit

class ButtonWithAMission: UIButton {
    
    var buttonIdentifier: String?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(title: String, action: Selector, target: Any, buttonIdentifier: String) {
        self.buttonIdentifier = buttonIdentifier
        super.init(frame: CGRect.zero)
        
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let size = CGSize(width: 320, height: 1000)
        let font = UIFont(name: "Orbitron-Light", size: 15)!
        let estimatedFrame = NSString(string: title).boundingRect(with: size, options: options, attributes: [NSFontAttributeName: font], context: nil)
        
        layer.cornerRadius = 4
        frame = CGRect(x: 0, y: 0, width: estimatedFrame.width + 30, height: 50)
        setTitle(title, for: .normal)
        titleLabel?.font = font
        addTarget(target, action: action, for: .touchUpInside)
        
        setTitleColor(UIColor.white, for: .normal)
        setBorderOutline(UIColor.white.cgColor)
    }
    
    static func createOptionButtons(with descriptions: [(title: String, buttonIdentifier: String)], target: Any, selector: Selector) -> UIView {
        
        let gap: CGFloat = 5
        
        var buttons = [ButtonWithAMission]()
        for (title, buttonIdentifier) in descriptions {
            let button = ButtonWithAMission(title: title, action: selector, target: target, buttonIdentifier: buttonIdentifier)
            button.addTarget(nil, action: #selector(chooseOption), for: .touchUpInside)
            buttons.append(button)
        }
        
        let stackView = UIStackView(arrangedSubviews: buttons)
        let height = buttons.reduce(0, { $0 + $1.frame.height }) + CGFloat(buttons.count - 1) * gap
        let maxWidth = buttons.map( { $0.frame.width } ).max()!
        stackView.frame = CGRect(x: 0, y: 0, width: maxWidth, height: height)
        stackView.axis = .vertical
        stackView.spacing = gap
        stackView.distribution = .fillEqually
        
        return stackView
    }
    
    @objc func chooseOption(sender: ButtonWithAMission) {
//        if sender.dialogViewColor == .white {
//            let blue = UIColor(red: 43/255, green: 120/255, blue: 165/255, alpha: 1)
//            sender.backgroundColor = blue
//            sender.layer.borderWidth = 0
//            sender.setTitleColor(UIColor.white, for: .normal)
//        } else {
            sender.backgroundColor = UIColor.white
            sender.setTitleColor(UIColor.black, for: .normal)
        //}
        let containerView = sender.superview!
        containerView.isUserInteractionEnabled = false
    }

}
