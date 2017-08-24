//
//  KrakenViewController.swift
//  Overpower
//
//  Created by Bright Future on 14/10/2016.
//  Copyright © 2016 Bright Future. All rights reserved.
//

import UIKit

class KrakenViewController: UIViewController, PopoverCollectionViewDelegate, UITextFieldDelegate, UIViewControllerTransitioningDelegate {
    
    @IBOutlet var playerAItems: [UIButton]!
    @IBOutlet var playerBItems: [UIButton]!
    @IBOutlet var playerCItems: [UIButton]!
    @IBOutlet weak var captureTimeLabel: UILabel!
    @IBOutlet weak var totalGoldTextField: UITextField! { didSet { totalGoldTextField.delegate = self } }
    
    var whichButton: UIButton?
    var playerItemButtonsArray = [UIButton]()
    let calculator = KrakenCalculator()
    let presentCollectionView = CollectionViewAnimator()
    
    // MARK:- Layout
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButtonsForIpad()
    }
    
    override func viewDidLayoutSubviews() {
        totalGoldTextField.useUnderLine()
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(keyboardDismissed), name: Notification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        presentCollectionView.presenting = true
        return presentCollectionView
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        presentCollectionView.presenting = false
        return presentCollectionView
    }
    
    // MARK:- User Input
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func keyboardDismissed(notification: NSNotification) {
        guard notification.name == Notification.Name.UIKeyboardWillHide else {
            return
        }
        calculator.totalGold = Double(totalGoldTextField.text!) ?? 0
        let captureTime = calculator.calcCaptureTime()
        captureTimeLabel.text = String(Int(round(captureTime)))
    }

    @IBAction func selectItem(_ sender: UIButton) {
        whichButton = sender
        presentPopoverCollectionVC(target: self, with: .captureKrakenItems)
    }
    
    func setWhichPlayer(sender: UIButton) -> Player {
        var whichPlayer: Player
        if playerAItems.contains(sender) {
            playerItemButtonsArray = playerAItems
            whichPlayer = calculator.players.playerA
        } else if playerBItems.contains(sender) {
            playerItemButtonsArray = playerBItems
            whichPlayer = calculator.players.playerB
        } else if playerCItems.contains(sender) {
            playerItemButtonsArray = playerCItems
            whichPlayer = calculator.players.playerC
        } else {
            fatalError()
        }
        return whichPlayer
    }
    
    func existingBuildForPlayer(buttonTapped: UIButton) -> [UIButton] {
        var player = [UIButton]()
        let whichPlayer = setWhichPlayer(sender: buttonTapped)
        if whichPlayer === calculator.players.playerA {
            player = playerAItems
        } else if whichPlayer === calculator.players.playerB {
            player = playerBItems
        } else if whichPlayer === calculator.players.playerC {
            player = playerCItems
        }
        
        return player
    }
    
    func get(object: AnyObject) {
        let item = object as! Items
        var buttonDictionary = [UIButton : Int]()
        let playerBuild = existingBuildForPlayer(buttonTapped: whichButton!)
        let player = setWhichPlayer(sender: whichButton!)
        
        var i = 0
        for button in playerBuild {
            buttonDictionary[button] = i
            i += 1
        }
        let itemIndex = buttonDictionary[whichButton!]
        
        whichButton!.setImage(item.image, for: .normal)
        player.build[itemIndex!] = item
        updateResult()
    }
    
    func updateResult() {
        let _ = setWhichPlayer(sender: whichButton!)
        let captureTime = calculator.calcCaptureTime()
        captureTimeLabel.text = String(Int(round(captureTime)))
    }
    
}
