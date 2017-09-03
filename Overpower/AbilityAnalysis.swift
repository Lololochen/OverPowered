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
        return enemyInfo() + basicAttackRawWeaponDamage() + basicAttackRawCrystalDamage() + itemStats()
    }
    
    func enemyInfo() -> [(String, String)] {
        let enemyHP = dataSource.defender.health
        let enemyShield = dataSource.defender.shield
        let enemyArmor = dataSource.defender.armor
        let weaponMitigationFactor = calcWeaponMitigationFactor()
        let crystalMitigationFactor = calcCrystalMitigationFactor()
        
        return [("Enemy HP".localizedString(), enemyHP.string()),
                ("Enemy shield".localizedString(), enemyShield.string()),
                ("Enemy armor".localizedString(), enemyArmor.string()),
                ("Enemy defense weapon damage mitigation factor".localizedString(), roundedString(weaponMitigationFactor)),
                ("Enemy defense crystal damage mitigation factor".localizedString(), roundedString(crystalMitigationFactor))]
    }
    
    func calcWeaponMitigationFactor() -> Double {
        let pierceRatio = dataSource.attacker.armorPierce
        let armor = dataSource.defender.armor
        return (pierceRatio + (1 - pierceRatio)) / (1 + armor/100)
    }
    
    func calcCrystalMitigationFactor() -> Double {
        let pierceRatio = dataSource.attacker.shieldPierce
        let shield = dataSource.defender.shield
        return (pierceRatio + (1 - pierceRatio)) / (1 + shield/100)
    }
    
    func basicAttackRawWeaponDamage() -> [(String, String)] {
        let damage = BasicAttackDamage(dataSource: dataSource).rawWeaponDamagePerHit
        let dps = BasicAttackDamage(dataSource: dataSource).rawWeaponDPS
        return [("Raw Weapon damage per basic attack".localizedString(), damage.string()), ("Basic attack raw weapon DPS".localizedString(), dps.string())]
    }
    
    func basicAttackRawCrystalDamage() -> [(String, String)] {
        let damage = BasicAttackDamage(dataSource: dataSource).rawCrystalDamagePerHit
        let dps = BasicAttackDamage(dataSource: dataSource).rawCrystalDPS
        
        if damage > 0 {
            return [("Raw crystal damage per basic attack".localizedString(), damage.string()), ("Raw crystal DPS".localizedString(), dps.string())]
        } else {
            return []
        }
    }
    
    func itemStats() -> [(String, String)] {
        var x = [(String, String)]()
        if dataSource.attacker.buildPower.build.contains(Item.aftershock) {
            let aftershockDamage = afterShockRawDamage()
            let lifesteal = aftershockDamage * 0.5
            x.append(("Aftershock raw damage".localizedString(), aftershockDamage.string()))
            x.append(("Aftershock lifesteal against heroes".localizedString(), lifesteal.string()))
        }
        return x
    }
    
    func afterShockRawDamage() -> Double {
        let x = dataSource.defender.health * 0.15
        let y = x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
        return y
    }

}
