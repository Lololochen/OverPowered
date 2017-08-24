//
//  Iterator.swift
//  Overpower
//
//  Created by Bright Future on 28/09/2016.
//  Copyright © 2016 Bright Future. All rights reserved.
//

import Foundation

class Iterator {
    
    var itemCount: Int
    var gold: Int
    var totalGold = 0
    var place = 0
    var itemIndex = 0
    var itemComposition: [Items] = []
    var bestComposition: [Items] = []
    var bestBuildCost = 0
    var customMessage = ""
    
    init(itemCount: Int, gold: Int) {
        self.itemCount = itemCount
        self.gold = gold
    }
    
    func iterateItems<T: Items>(iterationItems: [T], removeItem: (T) -> Void, addItem: (T) -> Void, calculateEfficiency: () -> Void) -> ([Items], Int, String) {
        
        let maxIndex = iterationItems.count - 1
        while place < itemCount {
            if place == 0 {
                itemIndex = itemComposition[place].index
                while itemIndex < maxIndex {
                    removeItem(itemComposition[place] as! T)
                    itemIndex += 1
                    addItem(iterationItems[itemIndex])
                    calculateEfficiency()
                }
                removeItem(itemComposition[place] as! T)
                addItem(iterationItems[0])
                place += 1
            } else {
                while place < itemCount && place > 0 {
                    itemIndex = itemComposition[place].index
                    removeItem(itemComposition[place] as! T)
                    if itemIndex == maxIndex {
                        addItem(iterationItems[0])
                        place += 1
                    } else {
                        itemIndex += 1
                        addItem(iterationItems[itemIndex])
                        calculateEfficiency()
                        place = 0
                    }
                }
            }
        }
        return (bestComposition, bestBuildCost, customMessage)
    }
}
