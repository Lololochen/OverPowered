//
//  HelpViewController.swift
//  OverPowered
//
//  Created by Bright Future on 31/08/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {

    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    
    override func viewDidLoad() {
        firstLabel.text = "Raw damage: the amount of damage you'll deal if the target has 0 defense, crit damage is averaged.".localizedString()
        secondLabel.text = "Slow factor: slow factor = slow strength * slow duration, if you are slowed by a factor of 1, and your move speed is 4, your enemy can catch up 4m with you after the slow.".localizedString()
        thirdLabel.text = "Executable health: for abilities dealing damage based on target's missing health, this is the amount of target health below which you can absolutely kill the target.".localizedString()
    }

}
