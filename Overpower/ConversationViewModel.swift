//
//  ConversationViewModel.swift
//  OverPowered
//
//  Created by Bright Future on 03/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import UIKit

class ConversationViewModel: NSObject, UITextFieldDelegate, PopoverCollectionViewDelegate {

    var router: Router
    var conversationVC: ConversationVC
    var conversationContent = [DialogView]() {
        didSet {
            conversationVC.contentNeedsUpdate()
        }
    }
    
    init(router: Router, conversationVC: ConversationVC) {
        self.router = router
        self.conversationVC = conversationVC
        super.init()
        
        receiveNewContent(contents: router.post(data: OutGoingData(message: "LAUNCH")))
    }
    
    func receiveNewContent(contents: [IncomingData]) {
        
        var questionView: UILabel?
        var dialogView: DialogView!
        
        for content in contents {
            
            if content.question != nil {
                questionView = DialogView.createQuestion(content.question!)
            }
            
            switch content.answerType {
            case .rectangleButtons(let associatedValues):
                let buttonCollection = ButtonWithAMission.createOptionButtons(with: associatedValues, target: self, selector: #selector(optionSelected))
                dialogView = DialogView(superViewWidth: conversationVC.cellWidth, questionView: questionView, answerView: buttonCollection)
                
            case .button:
                let button = SelectableButton(containedSelectable: nil, identifier: content.answerIdentifier!).heroPlaceholder(target: self, selector: #selector(selectHero))
                dialogView = DialogView(superViewWidth: conversationVC.cellWidth, questionView: questionView, answerView: button)
                
            case .textField(let regex):
                let textField = TextFieldWithAMission(answerIdentifier: content.answerIdentifier!, regex: regex, target: self, action: #selector(inputComplete))
                dialogView = DialogView(superViewWidth: conversationVC.cellWidth, questionView: questionView, answerView: textField)
                
            case .selectBuildView:
                let selectBuildView = SelectBuildView(target: self, selectItemAction: #selector(selectBuild), buttonIdentifier: content.answerIdentifier!)
                dialogView = DialogView(superViewWidth: conversationVC.cellWidth, questionView: questionView, answerView: selectBuildView)

            }
            
            conversationContent.append(dialogView)
        }
    }

    var selectedButton: SelectableButton?
    
    var selectedTextField: TextFieldWithAMission? {
        didSet {
            let data = OutGoingData(name: selectedTextField!.answerIdentifier!, number: Int(selectedTextField!.text!))
            receiveNewContent(contents: router.post(data: data))
        }
    }
    
    var selectedOptionButton: ButtonWithAMission? {
        didSet {
            let data = OutGoingData(message: selectedOptionButton!.buttonIdentifier!)
            receiveNewContent(contents: router.post(data: data))
        }
    }
    
    @objc func optionSelected(sender: ButtonWithAMission) {
        let data = OutGoingData(message: sender.buttonIdentifier!)
        receiveNewContent(contents: router.post(data: data))
    }
    
    @objc func selectHero(sender: SelectableButton) {
        conversationVC.presentPopover(sender: sender, dataSourceType: .heros)
        selectedButton = sender
    }
    
    @objc func inputComplete(sender: TextFieldWithAMission) {
        if verifyInput(input: sender.text!, regex: sender.regex) {
            selectedTextField = sender
        }
    }
    
    @objc func selectBuild(sender: SelectableButton) {
        conversationVC.presentPopover(sender: sender, dataSourceType: .items)
        selectedButton = sender
    }
    
    func get(object: Selectable) {
        
        if let item = object as? LocalItem {
            if selectedButton!.containedSelectable!.name != LocalItem.emptyItem.name {
                let data = OutGoingData(name: "DELETE" + " " + selectedButton!.identifier!, selectable: selectedButton!.containedSelectable!.name)
                receiveNewContent(contents: router.post(data: data))
            }
            
            if item.name == "Empty" {
                selectedButton!.containedSelectable = LocalItem.emptyItem
                return
            }
        }
        selectedButton!.containedSelectable = object
        
        let data = OutGoingData(name: selectedButton!.identifier!, selectable: object.name)
        receiveNewContent(contents: router.post(data: data))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func verifyInput(input: String, regex: String) -> Bool {
        let result = NSPredicate(format:"SELF MATCHES %@", regex).evaluate(with: input)
        if result == false {
            let alert = UIAlertController(title: "Oops", message: "This input is invalid -_-".localizedString(), preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            conversationVC.present(alert, animated: true, completion: nil)
        }
        return result
    }


}
