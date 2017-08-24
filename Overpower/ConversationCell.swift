//
//  ConversationCell.swift
//  OverPowered
//
//  Created by Bright Future on 07/03/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import UIKit

class ConversationCell: UICollectionViewCell {
    
    var dialogView: DialogView! {
        didSet {
            dialogView!.center = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
            contentView.addSubview(dialogView!)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        contentView.subviews.forEach( { $0.removeFromSuperview() } )
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }

}
