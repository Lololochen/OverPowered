//
//  Calculator.swift
//  Overpower
//
//  Created by Bright Future on 08/09/2016.
//  Copyright © 2016 Bright Future. All rights reserved.
//

import Foundation

class WPCalculator: Iterator {
    
    var hero: Hero
    var opponentArmor: Double
    var fightDuration: Double
    var weaponPower: Double = 0
    var attackSpeed: Double = 0
    var critChance: Double {
        get {
            return 0
        }
        set {
            if critChance > 1 {
                self.critChance = 1
            }
        }
    }
    var critDamage: Double = 0.5
    var armorPierce: Double = 0
    var highestWeaponDamage: Double = 0
    var attackCoolDown: Double = 1.4
    var trueDamage: Double = 0
    
    init(itemCount: Int, opponentArmor: Double, fightDuration: Double, hero: Hero) {
        self.opponentArmor = opponentArmor
        self.fightDuration = fightDuration
        self.hero = hero
        super.init(itemCount: itemCount, gold: 1000000)
        
        itemComposition = [WeaponItem](repeating: WeaponItem.sorrowBlade, count: itemCount)
        weaponPower = hero.weaponPowerHigh + Double(itemCount) * 150
        attackSpeed = hero.attackSpeedHigh
        totalGold += itemCount * 3100
    }
    
    func removeWeaponItem(item: WeaponItem) {
        weaponPower -= item.weaponPower
        attackSpeed -= item.attackSpeed
        critChance -= item.criticalChance
        critDamage -= item.criticalDamage
        armorPierce -= item.armorPierce
        totalGold -= item.price
        assert(totalGold >= 0, "Total gold is minus 0")
    }
    
    func addWeaponItem(item: WeaponItem) {
        
        if item === WeaponItem.bonesaw && itemComposition.contains(where: {item in item === WeaponItem.bonesaw}) {
            itemIndex += 1
            let newItem = WeaponItem.weaponItems[itemIndex]
            addWeaponItem(item: newItem)
            return
        }
        if item === WeaponItem.breakingPoint && itemComposition.contains(where: {item in item === WeaponItem.breakingPoint}) {
            itemIndex += 1
            let newItem = WeaponItem.weaponItems[itemIndex]
            addWeaponItem(item: newItem)
            return
        }
        
        weaponPower += item.weaponPower
        attackSpeed += item.attackSpeed
        critChance += item.criticalChance
        critDamage += item.criticalDamage
        armorPierce += item.armorPierce
        totalGold += item.price
        assert(armorPierce <= 1)
        itemComposition[place] = item
    }
    
    func calcWeaponDemage() {
        var weaponDPS = 0.0
        var armorPierceWithBS = armorPierce
        var weaponPowerWithBP = weaponPower
        var firstCrit: Double {
            if critChance > 0 {
                return weaponPower * critDamage
            } else {
                return 0
            }
        }
        
        if hero === Hero.baron {
            weaponPower = weaponPower * 1.3
        }
        if hero === Hero.glaive {
            critChance += 0.2
        }
        if hero === Hero.lance {
            attackSpeed = attackSpeed / 2
        }
        if hero === Hero.rona {
            weaponPower = weaponPower * 0.8
            attackSpeed = attackSpeed * 1.5
        }
        
        if itemComposition.contains(where: {item in item === WeaponItem.tensionBow}) {
            weaponDPS = Double(Int(fightDuration / 6) + 1) * 180 / fightDuration
        }
        
        if itemComposition.contains(where: {item in item === WeaponItem.bonesaw}) {
            let hitsPerSec = (attackSpeed) / attackCoolDown * 0.75
            // Mutiply by 0.75 to assume 75% of time time you are fighting.
            var bonesawStack = 0
            let t1 = 8 / hitsPerSec
            if fightDuration > t1 {
                bonesawStack = Int(8 - 4 * t1 / fightDuration)
                // Original: (t1 * 8 / 2 + (t - t1) * 8) / t
            } else {
                bonesawStack = Int(4 * fightDuration / t1)
            }
            armorPierceWithBS = 0.06 * Double(bonesawStack) + armorPierce
        }
        
        if itemComposition.contains(where: {item in item === WeaponItem.breakingPoint}) {
        
            let a = (1 + critChance * critDamage) * attackSpeed / attackCoolDown
            let b = armorPierceWithBS + (1 - armorPierceWithBS) / (1 + (86 + opponentArmor) / 100)
            let c = fightDuration * a * b * 0.75
            // Mutiply by 0.75 to assume 75% of time time you are fighting, minus 2 for the decay
            let d = weaponPower
            let quadraticB = (10 * c - 120)
            
            let testAnswer1: Double = (quadraticB + sqrt(quadraticB * quadraticB + 20 * c * d)) / 10
            let optimalStack = Int(round(testAnswer1 - 2))
            var averageStack: Int
            if optimalStack <= 25 {
                averageStack = optimalStack / 2
            } else {
                averageStack = min((optimalStack - 25) * (optimalStack - 25) / optimalStack + 25 / 2, 25)
                // Use min to avoid bizzare scenarios when optimal stack can go up to 60.
            }
            weaponPowerWithBP = Double(10 * averageStack) + weaponPower
        }
        
        weaponDPS += (1 + critChance * critDamage) * weaponPowerWithBP * attackSpeed / attackCoolDown + firstCrit / fightDuration
        trueDamage = armorPierceWithBS * weaponDPS + (1 - armorPierceWithBS) * weaponDPS / (1 + (hero.armorHigh + opponentArmor) / 100)
        if trueDamage > highestWeaponDamage {
            highestWeaponDamage = trueDamage
            bestComposition = itemComposition
            bestBuildCost = totalGold
            customMessage = NSLocalizedString("EstimatedDPS", comment: "") + String(Int(trueDamage)) + NSLocalizedString("Period", comment: "")
        }
    }
    
    func iterateWPItems() -> ([Items], Int, String) {
        return iterateItems(iterationItems: WeaponItem.weaponItems, removeItem: removeWeaponItem, addItem: addWeaponItem, calculateEfficiency: calcWeaponDemage)
    }
    
}
