//
//  FreeBuildVC.swift
//  Overpower
//
//  Created by Bright Future on 10/10/2016.
//  Copyright © 2016 Bright Future. All rights reserved.
//

import UIKit

class DPSCalculatorVC: UIViewController, PopoverCollectionViewDelegate, UITextFieldDelegate, UIViewControllerTransitioningDelegate {
    
    @IBOutlet var selfItemsButtonCollection: [UIButton]!
    @IBOutlet weak var selfHeroButton: UIButton!
    @IBOutlet weak var selfLevelSlider: UISlider!
    @IBOutlet weak var selfLevelLabel: UILabel!
    
    @IBOutlet var opponentItemsButtonCollection: [UIButton]!
    @IBOutlet weak var opponentHeroButton: UIButton!
    @IBOutlet weak var opponentLevelSlider: UISlider!
    @IBOutlet weak var opponentLevelLabel: UILabel!
    
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var DPSLabel: UILabel!
    
    var calculator = DPSCalculator()
    
    var whichButton: UIButton?
    var whichPlayer: Who?
    var selfButtonItemDictionary = [UIButton : WeaponItem]()
    var opponentButtonItemDictionary = [UIButton : DefenseItem]()
    let presentCollectionView = CollectionViewAnimator()
    
    enum Who {
        case myself
        case opponent
    }
    enum Alert {
        case breakingPoint, tensionBow, bonesaw
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK:- Layout
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButtonsForIpad()
        createItemDictionary()
        definesPresentationContext = true
    }
    
    func updateResult() {
        let DPS = calculator.calcTrueDPS()
        let cost = calculator.calcCost()
        DPSLabel.text = String(Int(round(DPS)))
        costLabel.text = String(cost)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        presentCollectionView.presenting = true
        return presentCollectionView
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        presentCollectionView.presenting = false
        return presentCollectionView
    }
    
    // MARK:- Input
    
    @IBAction func selectItem(_ sender: UIButton) {
        whichButton = sender
        setWhichPlayer(sender: sender)
        if whichPlayer == .myself {
            presentPopoverCollectionVC(target: self, with: .calcDPSItems)
        } else {
            presentPopoverCollectionVC(target: self, with: .turretDiveItems)
        }
    }
    
    @IBAction func selectHero(_ sender: UIButton) {
        whichButton = sender
        setWhichPlayer(sender: sender)
        presentPopoverCollectionVC(target: self, with: .heros)
    }
    
    @IBAction func sliderMoved(sender: UISlider) {
        
        sender.setValue(Float(lroundf(sender.value)), animated: true)
        let value = Int(sender.value)
        
        if sender === selfLevelSlider {
            calculator.selfHero.level = value
            selfLevelLabel.text = String(value)
        } else {
            calculator.opponentHero.level = value
            opponentLevelLabel.text = String(value)
        }
        updateResult()
    }
    
    // MARK:- Action
    
    func createItemDictionary() {
        for button in selfItemsButtonCollection {
            selfButtonItemDictionary[button] = WeaponItem(name: "Empty item", price: 0, image: #imageLiteral(resourceName: "EmptyItem"))
        }
        for button in opponentItemsButtonCollection {
            opponentButtonItemDictionary[button] = DefenseItem(name: "Empty item", price: 0, image: #imageLiteral(resourceName: "EmptyItem"))
        }
    }
    
    func setWhichPlayer(sender: UIButton) {
        if opponentItemsButtonCollection.contains(sender) {
            whichPlayer = .opponent
        } else if opponentHeroButton === sender {
            whichPlayer = .opponent
        } else {
            whichPlayer = .myself
        }
    }
    
    func get(object: AnyObject) {
        
        switch object {
        case let hero as Hero:
            getHero(hero: hero)
        case let weaponItem as WeaponItem:
            getItemForSelf(item: weaponItem)
            if let alert = showAlertOrNot(item: weaponItem) {
                self.present(alert, animated: true, completion: nil)
            }
        case let defenseItem as DefenseItem:
            getItemForOpponent(item: defenseItem)
        default:
            break
        }
        updateResult()
    }
    
    func getHero(hero: Hero) {
        if whichPlayer == .myself {
            calculator.selfHero = hero
        } else {
            calculator.opponentHero = hero
        }
        whichButton?.setImage(hero.image, for: .normal)
    }
    
    func getItemForSelf(item: WeaponItem) {
        selfButtonItemDictionary[whichButton!] = item
        whichButton!.setImage(item.image, for: .normal)
        calculator.selfBuild = [WeaponItem](selfButtonItemDictionary.values)
    }
    
    func getItemForOpponent(item: DefenseItem) {
        opponentButtonItemDictionary[whichButton!] = item
        whichButton!.setImage(item.image, for: .normal)
        calculator.opponentBuild = [DefenseItem](opponentButtonItemDictionary.values)
    }
    
    func showAlertOrNot(item: WeaponItem) -> UIAlertController? {
        var alertController: UIAlertController!
        let actionTitle = NSLocalizedString("Confirm", comment: "")
        
        switch item.name {
        case "Breaking Point":
            let title = NSLocalizedString("AlertTitle4BreakingPoint", comment: "")
            let message = NSLocalizedString("AlertMessage4BreakingPoint", comment: "")
            alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: actionTitle, style: UIAlertActionStyle.default) { action in
                self.calculator.breakingPointStack = Int(alertController.textFields![0].text!) ?? 0
                self.updateResult()
            })
            
        case "Tension Bow":
            let title = NSLocalizedString("AlertTitle4TensionBow", comment: "")
            let message = NSLocalizedString("AlertMessage4TensionBow", comment: "")
            alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: actionTitle, style: UIAlertActionStyle.default) { action in
                self.calculator.fightDuration = Double(alertController.textFields![0].text!) ?? 0
                self.updateResult()
            })
            
        case "Bonesaw":
            let title = NSLocalizedString("AlertTitle4Bonesaw", comment: "")
            let message = NSLocalizedString("AlertMessage4Bonesaw", comment: "")
            alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: actionTitle, style: UIAlertActionStyle.default) { action in
                self.calculator.bonesawStack = Int(alertController.textFields![0].text!) ?? 0
                self.updateResult()
            })
        default:
            return nil
        }
        alertController.addTextField()
        
        return alertController
    }
    
}
