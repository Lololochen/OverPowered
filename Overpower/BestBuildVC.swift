//
//  ViewController.swift
//  Overpower
//
//  Created by Bright Future on 07/09/2016.
//  Copyright © 2016 Bright Future. All rights reserved.
//

import UIKit

class BestBuildVC: ConditionVC, UITextFieldDelegate, HeroSelectionDelegate {

    // MARK:- Input data
    
    var hero: Hero = .kestrel
    let localizedString = NSLocalizedString("BestBuildTutorial", comment: "")
    var tutorialURL = URL(string: "https://medium.com/over-power-vainglroy/how-to-use-op-to-your-best-advantage-ca1e8278acb5#.us1z19iyh")!
    
    private var itemCount: Int {
        return Int(itemCountTextField.text!)!
    }
    private var opponentArmor: Double {
        if opponentArmorTextField.text != "" {
            return Double(opponentArmorTextField.text!)!
        } else {
            return 0
        }
    }
    private var fightDuration: Double {
        if fightDurationTextField.text != "" {
            return Double(fightDurationTextField.text!)!
        } else {
            return 8
        }
    }
    private var wpCalculator: WPCalculator? {
        return WPCalculator(itemCount: itemCount, opponentArmor: opponentArmor, fightDuration: fightDuration, hero: hero)
    }
    var cpCalculator: CPCalculator? {
        return CPCalculator(itemCount: itemCount, opponentShield: opponentArmor, fightDuration: fightDuration)
    }
    
    // MARK:- Outlets
    
    @IBOutlet weak var itemCountTextField: UITextField! { didSet { itemCountTextField.delegate = self } }
    @IBOutlet weak var opponentArmorTextField: UITextField! { didSet { opponentArmorTextField.delegate = self } }
    @IBOutlet weak var fightDurationTextField: UITextField! { didSet { fightDurationTextField.delegate = self } }
    @IBOutlet weak var heroSelectionButton: UIButton!
    @IBOutlet weak var opponentDefenseLabel: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var calculateButton: UIButton!
    
    // MARK:- Layout
    
    override func viewDidAppear(_ animated: Bool) {
        heroSelectionButton.layer.borderWidth = 1
        heroSelectionButton.layer.borderColor = UIColor(red: 255 / 255, green: 65 / 255, blue: 88 / 255, alpha: 1).cgColor
    }
    
    override func viewDidLayoutSubviews() {
        
        itemCountTextField.useUnderLine()
        opponentArmorTextField.useUnderLine()
        fightDurationTextField.useUnderLine()
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(keyboardDismissed), name: Notification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func setPopoverSize(VC: UIViewController, sender: UIButton) {
        VC.preferredContentSize = CGSize(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 2)
        VC.modalPresentationStyle = UIModalPresentationStyle.popover
        VC.popoverPresentationController?.sourceView = sender
        VC.popoverPresentationController?.sourceRect = sender.bounds
    }
    
    // MARK:- Animation
    
    func segmentControlAnimation(for index: Int) {
        if index == 0 {
            heroSelectionButton.layer.borderColor = UIColor(red: 255/255, green: 65/255, blue: 88/255, alpha: 1).cgColor
            UIView.animate(withDuration: 0.3) {
                self.heroSelectionButton.imageView?.alpha = 1
            }
        } else {
            heroSelectionButton.layer.borderColor = UIColor.cyan.cgColor
            UIView.animate(withDuration: 0.3) {
                self.heroSelectionButton.imageView?.alpha = 0
            }
        }
    }
    
    func buttonRotateAnimation() {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(M_PI)
        rotateAnimation.speed = 3.0
        rotateAnimation.repeatCount = .infinity
        self.calculateButton.layer.add(rotateAnimation, forKey: nil)
    }
    
    // MARK:- Navigation
    
    @IBAction func segmentControlValueChanged(_ sender: UISegmentedControl) {
        if segmentControl.selectedSegmentIndex == 0 {
            // Weapon power
            
            heroSelectionButton.isEnabled = true
            self.opponentDefenseLabel.text = NSLocalizedString("OpponentArmor:", comment: "")
            segmentControlAnimation(for: 0)
        } else {
            // Crystal power
            
            heroSelectionButton.isEnabled = false
            self.opponentDefenseLabel.text = NSLocalizedString("OpponentShield:", comment: "")
            segmentControlAnimation(for: 1)
        }
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func infoButtonTapped(_ sender: UIButton) {
    }
    
    //MARK:- Input events
    
    @IBAction func selectHero(_ sender: UIButton) {
        
        let VC = storyboard?.instantiateViewController(withIdentifier: "HeroCollectionVC") as! HeroCollectionVC
        VC.delegate = self
        setPopoverSize(VC: VC, sender: sender)
        self.present(VC, animated: true, completion: nil)
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        
        let dataSource = setDataSource()
        DispatchQueue.global(qos: .userInitiated).async {
            self.openCircle(withCenter: sender.center, dataSource: dataSource)
            DispatchQueue.main.sync {
                self.calculateButton.layer.removeAllAnimations()
            }
        }
        buttonRotateAnimation()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func keyboardDismissed(notification: NSNotification) {
        guard notification.name == Notification.Name.UIKeyboardWillHide else {
            return
        }
        if itemCountTextField.text != "" {
            calculateButton.isEnabled = true
        } else {
            calculateButton.isEnabled = false
        }
    }
    
    func selectedHero(hero: Hero) {
        heroSelectionButton.setImage(hero.image, for: .normal)
        self.hero = hero
        return
    }
    
    // MARK:- Calculation
    
    func setDataSource() -> ([Items], Int, String) {
        var dataSource: ([Items], Int, String) = ([], 0, "")
        if segmentControl.selectedSegmentIndex == 0 {
            let calculator = wpCalculator
            dataSource = calculator!.iterateWPItems()
        } else {
            let calculator = cpCalculator
            dataSource = calculator!.iterateCPItems()
        }
        return dataSource
    }

}

