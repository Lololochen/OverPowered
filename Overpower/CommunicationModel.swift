//
//  CommunicationDataModel.swift
//  OverPowered
//
//  Created by Bright Future on 13/03/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

struct IncomingData {
    
    enum AnswerType {
        case button, selectBuildView
        case textField(regex: String)
        case rectangleButtons( [ (title: String, buttonIdentifier: String) ] )
    }
    
    let question: String?
    let answerType: AnswerType
    let answerIdentifier: String?
    
}

struct OutGoingData {
    
    let name: String
    var number: Int?
    var selectable: String?
    var options: [String]?
    
    init(message: String) {
        self.name = message
    }
    init(name: String, number: Int?) {
        self.name = name
        self.number = number
    }
    init(name: String, options: [String]) {
        self.name = name
        self.options = options
    }
    init(name: String, selectable: String) {
        self.name = name
        self.selectable = selectable
    }
}
