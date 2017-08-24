//
//  AbilityAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 03/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class AbilityAnalysis {
    
    var dataSource: DataSource
    init(dataSource: DataSource) {
        self.dataSource = dataSource
    }
    
    var result = [(String, String)]()
    
    func roundedString(_ number: Double) -> String {
        return String(Double(round(10 * number)/10))
    }
    
    func percentageString(_ number: Double) -> String {
        let rounded = Int(round(number * 100))
        return String(rounded) + "%"
    }
    
    func genericInfo() -> [(String, String)] {
        return enemyInfo() + basicAttackDPS() + itemStats()
    }
    
    func enemyInfo() -> [(String, String)] {
        let enemyHP = dataSource.defender.health
        let enemyShield = dataSource.defender.shield
        let enemyArmor = dataSource.defender.armor
        
        return [("Enemy HP".localizedString(), enemyHP.string()),
                ("Enemy shield".localizedString(), enemyShield.string()),
                ("Enemy armor".localizedString(), enemyArmor.string())]
    }
    
    func basicAttackDPS() -> [(String, String)] {
        let dps = DPSCalculator(dataSource: dataSource).dps
        return [("Basic attack DPS".localizedString(), dps.string())]
    }
    
    func itemStats() -> [(String, String)] {
        var x = [(String, String)]()
        if dataSource.attacker.buildPower.build.contains(Item.aftershock) {
            let aftershockDamage = MaxHealthDamageCalculator(dataSource: dataSource, maxHealthRatio: 0.15).afterShockDamage()
            x.append(("Aftershock damage".localizedString(), aftershockDamage.string()))
        }
        return x
    }

}
