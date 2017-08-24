//
//  Player.swift
//  OverPowered
//
//  Created by Bright Future on 03/01/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class Player {
    var build = [Items](repeatElement(Items(name: "Empty Item", price: 0, image: #imageLiteral(resourceName: "EmptyItem")), count: 5))
    var bonesawStack = 0
    
    var weaponPower = 136.0
    var attackSpeed = 1.1
    var critChance = 0.0
    var critDamage = 0.5
    var armorPierce = 0.0
    
    var crystalPower = 0.0
    var abilityCooldown = 1.0
    var shieldPierce = 0.0
    
    var trueDamage = 0.0
}
