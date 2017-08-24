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
    let aAbilityDpsCrystalRatio = 2.1
    let aAbilityDpsWeaponRatio = 0.7
    let aAbilityLockOnBonus = 0.1
    let aAbilityLockOnBonusCrystalRatio = 0.1
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
    
    var aAbilityDps: Double {
        let weaponStrength = dataSource.attacker.buildPower.weaponPower * aAbilityDpsWeaponRatio
        let weaponDamage = DamageCalculator(dataSource: dataSource).receivedWeaponDamage(weaponStrength)
        let crystalStrength = aAbilityDpsPerTier[aAbilityTier]! + dataSource.attacker.crystalPower * aAbilityDpsCrystalRatio
        let crystalDamage = DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(crystalStrength)
        return weaponDamage + crystalDamage
    }
    
    var aAbilityLockOnDPS: Double {
        let x = dataSource.attacker.crystalPower * aAbilityLockOnBonusCrystalRatio
        let lockOnCPdps = DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
        return lockOnCPdps + aAbilityDps * 1.1
    }
    
    var aAbilitySlowStrength: Double {
        let slow = dataSource.attacker.buildPower.weaponPower * 0.2
        return (slow > 0.4) ? 0.4 : slow
    }
    
    var aAbilityCooldown: Double {
        return aAbilityCooldownPerTier[aAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //B ability
    
    var bAbilityDamage: Double {
        let x = bAbilityDamagePerTier[bAbilityTier]! + dataSource.attacker.crystalPower * bAbilityCpRatio
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var bAbilityCooldownReset: Double {
        return bAbilityCooldownResetPerTier[bAbilityTier]!
    }
    
    var bAbilityTargetLockDurationBonus: Double {
        return bAbilityTargetLockDurationBonusPerTier[bAbilityTier]!
    }
    
    var bAbilityCooldown: Double {
        return bAbilityCooldownPerTier[bAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //ult
    
    var ultDamage: Double {
        let x = ultDpsPerTier[ultTier]! + dataSource.attacker.crystalPower * ultCpRatio
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var ultSlowStrength: Double {
        return ultSlowPerTier[ultTier]!
    }
    
    var ultTargetLockRangeBonus: Double {
        return ultTargetLockRangeBonusPerTier[ultTier]!
    }
    
    var ultCooldown: Double {
        return ultCooldownPerTier[ultTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
}
