//
//  TurretDiveVC.swift
//  Overpower
//
//  Created by Bright Future on 07/11/2016.
//  Copyright © 2016 Bright Future. All rights reserved.
//

import UIKit

class TurretDiveVC: UIViewController, PopoverCollectionViewDelegate, UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var heroImage: UIButton!
    @IBOutlet var itemCollection: [UIButton]!
    @IBOutlet weak var HPSlider: UISlider!
    @IBOutlet weak var HPValue: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var levelSlider: UISlider!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var resultDurationLabel: UILabel!
    
    var whichButton: UIButton?
    let calculator = TurretDiveCalculator()
    let presentCollectionView = CollectionViewAnimator()
    
    // MARK:- Interface
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButtonsForIpad()
        updateResult()
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        presentCollectionView.presenting = true
        return presentCollectionView
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        presentCollectionView.presenting = false
        return presentCollectionView
    }
    
    // MAR:- User Input
    
    @IBAction func HPsliderValueChanged(_ sender: UISlider) {
        calculator.HPPercentage = Double(HPSlider.value)
        HPValue.text = String(Int(HPSlider.value * 100)) + " %"
        updateResult()
    }
    
    @IBAction func sliderMoved(sender: UISlider) {
        sender.setValue(Float(lroundf(levelSlider.value)), animated: true)
        calculator.hero.level = Int(sender.value)
        levelLabel.text = String(Int(sender.value))
        updateResult()
    }
    
    @IBAction func selectHeroOrItem(_ sender: UIButton) {
        whichButton = sender
        if sender == heroImage {
            presentPopoverCollectionVC(target: self, with: .heros)
        } else {
            presentPopoverCollectionVC(target: self, with: .turretDiveItems)
        }
    }
    
    // MARK:- Processing
    
    func selectedHero(hero: Hero) {
        heroImage.setImage(hero.image, for: .normal)
        calculator.hero = hero
        updateResult()
    }
    
    func selectedItem(item: DefenseItem) {
        var buttonDictionary = [UIButton : Int]()
        var i = 0
        for button in itemCollection {
            buttonDictionary[button] = i
            i += 1
        }
        
        let indexForButton = buttonDictionary[whichButton!]
        whichButton!.setImage(item.image, for: .normal)
        calculator.build[indexForButton!] = item
        updateResult()
    }
    
    func get(object: AnyObject) {
        if let item = object as? DefenseItem {
            selectedItem(item: item)
        } else if let hero = object as? Hero {
            selectedHero(hero: hero)
        }
    }
    
    func updateResult() {
        resultLabel.text = String(calculator.simulateDiving().shots)
        resultDurationLabel.text = String(calculator.simulateDiving().duration)
    }
    
}
