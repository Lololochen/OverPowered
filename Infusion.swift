//
//  Infusion.swift
//  OverPowered
//
//  Created by Bright Future on 02/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class Infusion: Item {
    
    var level: Int
    var type: InfusionType
    
    enum InfusionType {
        case crystal
        case weapon
    }
    
    init(level: Int, type: InfusionType) {
        self.level = level
        self.type = type
        
        switch type {
        case .weapon:
            let weaponPower = 40 / 11 * Double(level - 1) + 20
            let attackSpeed = 0.1 / 11 * Double(level - 1) + 0.05
            let armor = 20 / 11 * Double(level - 1) + 10
            let shield = 20 / 11 * Double(level - 1) + 10
            super.init(name: "Weapon Infusion", price: 500, weaponPower: weaponPower, attackSpeed: attackSpeed, armor: armor, shield: shield)
            
        case .crystal:
            let crystalPower = 40 / 11 * Double(level - 1) + 20
            let cooldownReduction = 0.15 / 11 * Double(level - 1) + 0.1
            let armor = 20 / 11 * Double(level - 1) + 10
            let shield = 20 / 11 * Double(level - 1) + 10
            super.init(name: "Crystal Infusion", price: 500, crystalPower: crystalPower, cooldownReduction: cooldownReduction, armor: armor, shield: shield)
        }
    }
}
