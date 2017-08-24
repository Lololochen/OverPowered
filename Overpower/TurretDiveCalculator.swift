//
//  TurretDiveCalculator.swift
//  Overpower
//
//  Created by Bright Future on 06/11/2016.
//  Copyright © 2016 Bright Future. All rights reserved.
//

import UIKit

class TurretDiveCalculator {
    
    var hero: Hero = .taka
    var build = [DefenseItem](repeatElement(DefenseItem(name: "Empty Item", price: 0, image: #imageLiteral(resourceName: "EmptyItem")), count: 6))
    var HPPercentage: Double = 1
    
    func calcHPAndDefense() -> (Double, Double, Double) {
        let baseHP = hero.baseStats.HPLow + (hero.baseStats.HPHigh - hero.baseStats.HPLow) / 12 * Double(hero.level)
        let baseDefense = hero.baseStats.armorLow + (hero.baseStats.armorHigh - hero.baseStats.armorLow) / 12 * Double(hero.level) + hero.baseStats.shieldLow + (hero.baseStats.shieldHigh - hero.baseStats.shieldLow) / 12 * Double(hero.level)
        
        var buildHP = 0.0
        var buildDefense = 0.0
        for item in build {
            buildDefense += item.armor
            buildDefense += item.shield
            buildHP += item.HP
        }
        
        let fullHP = baseHP + buildHP
        let HP = fullHP * HPPercentage
        let defense = baseDefense + buildDefense
        
        return (fullHP, HP, defense)
    }

    func simulateDiving() -> (shots: Int, duration: Double) {
        var (fullHP, HP, defense) = calcHPAndDefense()
        var numberOfShots = 0
        
        while HP > 0 {
            let perShotDamageRaw: Double = pow(1.45, Double(numberOfShots)) * (160 + 0.075 * fullHP) + Double(hero.level) * 8
            let mitigatedDamage: Double = 0.15 * perShotDamageRaw + 0.85 * perShotDamageRaw / (100 + defense) * 100
            
            if numberOfShots < 7 {
            HP -= mitigatedDamage
            } else {
                let saturatedDamageMitigated = 0.09 * 7 * (150 + 0.1 * fullHP) + 0.81 * 7 * (150 + 0.1 * fullHP) / (100 + defense) * 100
                HP -= saturatedDamageMitigated
            }
            if HP > 0 {
                numberOfShots += 1
            }
        }
        let duration = 1.65 * Double(numberOfShots)
        
        return (numberOfShots, duration)
    }
    
        
}
