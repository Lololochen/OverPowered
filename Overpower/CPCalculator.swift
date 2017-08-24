//
//  CPCalculator.swift
//  Overpower
//
//  Created by Bright Future on 10/10/2016.
//  Copyright © 2016 Bright Future. All rights reserved.
//

import Foundation

class CPCalculator: Iterator {
    
    var hero: Hero
    var opponentShield: Double
    var fightDuration: Double
    var totalCrystalPower: Double = 0
    var totalCooldownSpeed: Double = 1
    var totalShieldPierce: Double = 0
    var highestCrystalDamage: Double = 0
    var trueDamage: Double = 0
    
    init(itemCount: Int, opponentShield: Double, fightDuration: Double, hero: Hero = Hero.kestrel) {
        self.opponentShield = opponentShield
        self.fightDuration = fightDuration
        self.hero = hero
        super.init(itemCount: itemCount, gold: 1000000)
        
        itemComposition = [CrystalItem](repeating: CrystalItem.shatterglass, count: itemCount)
        totalCrystalPower = Double(itemCount) * 150
        totalGold += itemCount * 3000
    }
    
    func removeItem(item: CrystalItem) {
        totalCrystalPower -= item.crystalPower
        totalCooldownSpeed -= item.cooldownSpeed
        totalShieldPierce -= item.shieldPierce
        totalGold -= item.price
        assert(totalGold >= 0, "Total gold is minus 0")
    }
    
    func addItem(item: CrystalItem) {
        
        totalCrystalPower += item.crystalPower
        totalCooldownSpeed += item.cooldownSpeed
        totalShieldPierce += item.shieldPierce
        totalGold += item.price
        itemComposition[place] = item
    }
    
    func calcCrystalDemage() {
        var crystalDPS: Double = totalCrystalPower * totalCooldownSpeed
        
        // Item passives
        if itemComposition.contains(where: {item in item === CrystalItem.brokenMyth}) {
            if fightDuration > 10 {
                crystalDPS += crystalDPS * ((fightDuration - 5) / fightDuration * 0.35 + 5 / fightDuration * 0.35 / 2)
            } else {
                crystalDPS += crystalDPS * 0.07 * fightDuration / 2
            }
        }
        if itemComposition.contains(where: {item in item === CrystalItem.clockwork}) {
            crystalDPS = crystalDPS * 1.3
        }
        
        trueDamage = totalShieldPierce * crystalDPS + (1 - totalShieldPierce) * crystalDPS / (1 + (hero.shieldHigh + opponentShield ) / 100)
        if trueDamage > highestCrystalDamage {
            highestCrystalDamage = trueDamage
            bestComposition = itemComposition
            bestBuildCost = totalGold
            customMessage = ""
        }
    }
    
    func iterateCPItems() -> ([Items], Int, String) {
        return iterateItems(iterationItems: CrystalItem.abilityItems, removeItem: removeItem, addItem: addItem, calculateEfficiency: calcCrystalDemage)
    }
}
