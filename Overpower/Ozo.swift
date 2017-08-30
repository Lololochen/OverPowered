//
//  Ozo.swift
//  OverPowered
//
//  Created by yy on 2017/8/13.
//  Copyright © 2017年 Bright Future. All rights reserved.
//

import Foundation

struct Ozo {
    
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
    
    let aAbilityCdPeTier: [Int : Double] = [1 : 8, 2 : 7.5, 3 : 7, 4 : 6.5, 5 : 5]
    let aAbilityDamagePerTier: [Int : Double] = [1 : 10, 2 : 20, 3 : 30, 4 : 40, 5 : 50]
    let aAbilityCpRatio = 0.75
    let aAbilityHealPerTier: [Int : Double] = [1 : 15, 2 : 30, 3 : 45, 4 : 60, 5 : 75]
    let aAbilityHealCrystalRatio = 0.15
    
    let bAbilityCdPerTier: [Int : Double] = [1 : 10, 2 : 9.5, 3 : 9, 4 : 8.5, 5 : 7]
    let bAbilityInitialDamagePerTier: [Int : Double] = [1 : 60, 2 : 120, 3 : 180, 4 : 240, 5 : 300]
    let bAbilityFinalDamagePerTier: [Int : Double] = [1 : 80, 2 : 160, 3 : 240, 4 : 320, 5 : 400]
    let bAbilityBonusDamagePerBouncePerTier: [Int : Double] = [1 : 20, 2 : 40, 3 : 60, 4 : 80, 5 : 100]
    let bAbilityFortifiedHealPerTier: [Int : Double] = [1 : 20, 2 : 40, 3 : 60, 4 : 80, 5 : 100]
    
    let ultDamagePerTier: [Int : Double] = [1 : 250, 2 : 400, 3 : 550]
    let ultCpRatio = 1.5
    let ultSecondaryTargetDamagePerTier: [Int : Double] = [1 : 125, 2 : 200, 3 : 275]
    
    //A ability
    
    var aAbilityRawWeaponDamagePerHit: Double {
        let boostedWeaponPower = dataSource.attacker.weaponPower + aAbilityDamagePerTier[aAbilityTier]!
        let weaponPowerWithCrit = boostedWeaponPower * (1 + dataSource.attacker.critDamage) * dataSource.attacker.critChance + boostedWeaponPower * (1 - dataSource.attacker.critChance)
        return weaponPowerWithCrit
    }
    
    var aAbilityRawCrystalDamagePerHit: Double {
        let x = aAbilityCpRatio * dataSource.attacker.crystalPower
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var aAbilityHealPerHitPerEnemy: Double {
        return aAbilityHealPerTier[aAbilityTier]! + dataSource.attacker.crystalPower * aAbilityHealCrystalRatio
    }
    
    var aAbilityCooldown: Double {
        return aAbilityCdPeTier[aAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //B ability
    
    var bAbilityFirstTwoBounceRawDamage: Double {
        let x = bAbilityInitialDamagePerTier[bAbilityTier]! + dataSource.attacker.crystalPower * 0.7
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var bAbilityThirdBounceRawDamage: Double {
        let damage1 = bAbilityFinalDamagePerTier[bAbilityTier]! + dataSource.attacker.crystalPower * 0.7
        let damage2 = (bAbilityBonusDamagePerBouncePerTier[bAbilityTier]! + dataSource.attacker.crystalPower * 0.35) * 2
        let x = damage1 + damage2
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var bAbilitySpeedBoost: Double {
        let boost = 3 + dataSource.attacker.weaponPower * 0.0075
        return (boost > 4.5) ? 4.5 : boost
    }
    
    var bAbilityBoostDuration: Double {
        return 2 + dataSource.attacker.weaponPower * 0.0025
    }
    
    var bAbilityFortifiedHealthPerJump: Double {
        return bAbilityFortifiedHealPerTier[bAbilityTier]! + dataSource.attacker.crystalPower
    }
    
    var bAbilityCooldown: Double {
        return bAbilityCdPerTier[bAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //ult
    
    var ultRawDamage: Double {
        let x = ultDamagePerTier[ultTier]! + dataSource.attacker.crystalPower * ultCpRatio
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var ultSecondaryTargetRawDamage: Double {
        let x = ultSecondaryTargetDamagePerTier[ultTier]! + dataSource.attacker.crystalPower * 0.75
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
}
