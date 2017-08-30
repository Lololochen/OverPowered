//
//  Skye.swift
//  OverPowered
//
//  Created by yy on 2017/8/15.
//  Copyright © 2017年 Bright Future. All rights reserved.
//

import Foundation

struct Skye {
    
    var dataSource: DataSource
    init(dataSource: DataSource) {
        self.dataSource = dataSource
    }
    
    var aAbilityTier: Int {
        return dataSource.attacker.heroPower.aAbilityTier
    }
    var bAbilityTier: Int {
        return dataSource.attacker.heroPower.bAbilityTier
    }
    var ultTier: Int {
        return dataSource.attacker.heroPower.ultTier
    }
    
    let aAbilityCooldownPerTier: [Int : Double] = [1 : 6, 2 : 6, 3 : 6, 4 : 6, 5 : 5]
    let aAbilityDpsPerTier: [Int: Double] = [1 : 120, 2 : 160, 3 : 200, 4 : 240, 5 : 320]
    let aAbilityDpsCrystalRatio = 1.2
    let aAbilityDpsWeaponRatio = 0.7
    let aAbilityLockOnBonus = 0.1
    let aAbilityLockOnBonusCrystalRatio = 0.33
    let aAbilitySlowWeaponRatio = 0.2
    
    let bAbilityCooldownPerTier: [Int : Double] = [1 : 14, 2 : 12, 3 : 10, 4 : 8, 5 : 6]
    let bAbilityDamagePerTier: [Int : Double] = [1 : 90, 2 : 150, 3 : 210, 4 : 270, 5 : 330]
    let bAbilityCpRatio = 1.0
    let bAbilityCooldownResetPerTier: [Int : Double] = [1 : 0.4, 2 : 0.55, 3 : 0.7, 4 : 0.85, 5 : 1.0]
    let bAbilityTargetLockDurationBonusPerTier: [Int : Double] = [1 : 1, 2 : 1.5, 3 : 2, 4 : 2.5, 5 : 4]
    
    let ultCooldownPerTier: [Int : Double] = [1 : 30, 2 : 24, 3 : 18]
    let ultDpsPerTier: [Int : Double] = [1 : 250, 2 : 300, 3 : 350]
    let ultCpRatio = 0.5
    let ultSlowPerTier: [Int : Double] = [1 : 0.55, 2 : 0.6, 3 : 0.65]
    let ultTargetLockRangeBonusPerTier: [Int : Double] = [1 : 1.5, 2 : 3, 3 : 4.5]
    
    //A ability
    
    var aAbilityRawWeaponDPS: Double {
        return dataSource.attacker.buildPower.weaponPower * aAbilityDpsWeaponRatio
    }
    
    var aAbilityRawCrystalDPS: Double {
        let x = aAbilityDpsPerTier[aAbilityTier]! + dataSource.attacker.crystalPower * aAbilityDpsCrystalRatio
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var aAbilityLockOnRawCrystalDPS: Double {
        let bonusRatio = dataSource.attacker.crystalPower * aAbilityLockOnBonusCrystalRatio
        let newDamage = aAbilityDpsPerTier[aAbilityTier]! + dataSource.attacker.crystalPower * (aAbilityDpsCrystalRatio + bonusRatio)
        return newDamage * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var aAbilityLockOnFullRawCrystalDamage: Double {
        return aAbilityLockOnRawCrystalDPS * 3
    }
    
    var aAbilitySlowStrength: Double {
        let slow = dataSource.attacker.buildPower.weaponPower * 0.2
        return (slow > 0.4) ? 0.4 : slow
    }
    
    var aAbilityCooldown: Double {
        return aAbilityCooldownPerTier[aAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //B ability
    
    var bAbilityRawDamage: Double {
        let x = bAbilityDamagePerTier[bAbilityTier]! + dataSource.attacker.crystalPower * bAbilityCpRatio
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var bAbilityCooldown: Double {
        return bAbilityCooldownPerTier[bAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //ult
    
    var ultRawDPS: Double {
        let x = ultDpsPerTier[ultTier]! + dataSource.attacker.crystalPower * ultCpRatio
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var ultCooldown: Double {
        return ultCooldownPerTier[ultTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
}
