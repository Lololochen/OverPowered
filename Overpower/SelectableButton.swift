//
//  SelectableButton.swift
//  OverPowered
//
//  Created by Bright Future on 18/03/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import UIKit

class SelectableButton: UIButton {
    
    var containedSelectable: Selectable? {
        didSet {
            self.setImage(containedSelectable?.image, for: .normal)
        }
    }
    var identifier: String!
    
    init(containedSelectable: Selectable?, identifier: String) {
        self.containedSelectable = containedSelectable
        self.identifier = identifier
        super.init(frame: CGRect.zero)
        
        self.setImage(containedSelectable?.image, for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func heroPlaceholder(target: Any, selector: Selector) -> SelectableButton {
        frame.size = CGSize(width: 60, height: 60)
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
        backgroundColor = UIColor(white: 0, alpha: 0.2)
        addTarget(target, action: selector, for: .touchUpInside)
        return self
    }
    
}
