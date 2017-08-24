//
//  SelectBuildView.swift
//  OverPowered
//
//  Created by Bright Future on 08/03/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import UIKit

class SelectBuildView: UIView {
    
//    var build: [LocalItem] {
//        return buttons.flatMap({ $0.containedSelectable as? LocalItem})
//    }
    var target: Any!
    var selectItemAction: Selector!
    var buttonIdentifier: String!
    
    var itemRadius: CGFloat = 30
    var hexagonRadius: CGFloat = 70
    var width: CGFloat {
        return sqrt(3) * hexagonRadius + 2 * itemRadius
    }
    var height: CGFloat {
        return 2 * hexagonRadius + 2 * itemRadius
    }
    
    var buttons = [SelectableButton]()
    
    func setUpView() {
        for _ in 1...7 {
            let button = SelectableButton(containedSelectable: LocalItem.emptyItem, identifier: buttonIdentifier!)
            button.frame.size = CGSize(width: itemRadius * 2, height: itemRadius * 2)
            buttons.append(button)
        }
        buttons[0].frame.origin = CGPoint(x: 0, y: hexagonRadius / 2)
        buttons[1].frame.origin = CGPoint(x: sqrt(3)/2 * hexagonRadius, y: 0)
        buttons[2].frame.origin = CGPoint(x: width - itemRadius * 2, y: hexagonRadius / 2)
        buttons[3].frame.origin = CGPoint(x: width - itemRadius * 2, y: height - hexagonRadius / 2 - itemRadius * 2)
        buttons[4].frame.origin = CGPoint(x: sqrt(3)/2 * hexagonRadius, y: height - itemRadius * 2)
        buttons[5].frame.origin = CGPoint(x: 0, y: height - hexagonRadius / 2 - itemRadius * 2)
        buttons[6].center = center
        
        for button in buttons {
            addSubview(button)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(target: Any, selectItemAction: Selector, buttonIdentifier: String) {
        self.target = target
        self.selectItemAction = selectItemAction
        // self.confirmAction = confirmAction
        self.buttonIdentifier = buttonIdentifier
        super.init(frame: CGRect.zero)
        
        self.frame.size = CGSize(width: width, height: height)
        setUpView()

        for button in buttons {
            button.addTarget(target, action: selectItemAction, for: .touchUpInside)
        }
    }
    
}
