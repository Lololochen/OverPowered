//
//  BaseWeaponDamage.swift
//  OverPowered
//
//  Created by Bright Future on 03/03/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class PlayerFightPower {
    
    var heroPower = HeroPower()
    var buildPower = BuildPower()
    
    var weaponPower: Double {
        return (heroPower.weaponPower + buildPower.weaponPower) * heroPower.hero!.weaponPowerModifier
    }
    var attackSpeed: Double {
        return (heroPower.attackSpeed + buildPower.attackSpeed) * heroPower.hero!.attackSpeedModifier
    }
    var attackCooldown: Double {
        return heroPower.hero!.attackCooldown
    }
    
    var critChance: Double {
        let totalCritChance = heroPower.critChance + buildPower.critChance
        if totalCritChance > 1 { return 1 }
        return totalCritChance
    }
    
    var critDamage: Double {
        return buildPower.critDamage
    }
    
    var armorPierce: Double {
        if buildPower.armorPierce > 1 { return 1 }
        return buildPower.armorPierce
    }
    
    var crystalPower: Double {
        return buildPower.crystalPower
    }
    var cooldownReduction: Double {
        return buildPower.cooldownReduction
    }
    var shieldPierce: Double {
        if buildPower.shieldPierce > 1 { return 1 }
        return buildPower.shieldPierce
    }
    
    var armor: Double {
        if heroPower.hero == Hero.phinn {
            return (heroPower.armor + buildPower.armor) * (1 - armorShred) * 1.15
        }
        if heroPower.hero == Hero.catherine {
            return (heroPower.armor + buildPower.armor + Double(heroPower.captainOfTheGuardStack) * 2) * (1 - armorShred)
        }
        return (heroPower.armor + buildPower.armor) * (1 - armorShred)
    }
    
    var shield: Double {
        if heroPower.hero == Hero.phinn {
            return (heroPower.shield + buildPower.shield) * 1.15
        }
        if heroPower.hero == Hero.catherine {
            return heroPower.shield + buildPower.shield + Double(heroPower.captainOfTheGuardStack)
        }
        return heroPower.shield + buildPower.shield
    }
    
    var health: Double {
        if heroPower.hero == Hero.phinn {
            return (heroPower.health + buildPower.health) * 1.15
        }
        return heroPower.health + buildPower.health
    }
    
    var moveSpeed: Double {
        return heroPower.hero!.moveSpeed + buildPower.moveSpeed
    }
    
    var armorShred: Double = 0 {
        didSet {
            if armorShred > 0.4 {
                armorShred = 0.4
            }
        }
    }
    var fightDuration: Double = 6
    var isMeleeFighting = false
    
    init() {}
    
    init(hero: Hero) {
        self.heroPower.hero = hero
    }
}
