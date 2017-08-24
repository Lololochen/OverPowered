//
//  StartupViewController.swift
//  Overpower
//
//  Created by Bright Future on 13/09/2016.
//  Copyright © 2016 Bright Future. All rights reserved.
//

import UIKit

class AnalysisStartupVC: UIViewController, UINavigationBarDelegate {
    
    // MARK:- Interface
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButtonsForIpad()
    }

    @IBOutlet var buttonCollection: [UIButton]! {
        didSet {
            for button in buttonCollection {
                button.layer.borderWidth = 1
                button.layer.borderColor = UIColor.white.cgColor
                button.layer.cornerRadius = 10
            }
        }
    }
}
