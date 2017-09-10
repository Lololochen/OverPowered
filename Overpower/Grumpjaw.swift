//
//  Grumpjaw.swift
//  OverPowered
//
//  Created by yy on 2017/8/11.
//  Copyright © 2017年 Bright Future. All rights reserved.
//

import Foundation

struct Grumpjaw {
    
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
    
    let aAbilityCdPerTier: [Int : Double] = [1 : 12, 2 : 11, 3 : 10, 4 : 9, 5 : 8]
    let aAbilityDamagePerTier: [Int : Double] = [1 : 75, 2 : 125, 3 : 175, 4 : 225, 5 : 325]
    let aAbilityBonusDamagePerStackPerTier: [Int : Double] = [1 : 10, 2 : 25, 3 : 40, 4 : 55, 5 : 85]
    let aAbilityCpRatio = 0.5
    let aAbilityPerStackDamageCrystalRatio = 0.1
    
    let bAbilityCdPerTier: [Int : Double] = [1 : 9, 2 : 9, 3 : 9, 4 : 9, 5 : 9]
    let bAbilityEmpoweredDuration: [Int : Double] = [1 : 5, 2 : 5, 3 : 5, 4 : 5, 5 : 6]
    let bAbilityDamagePerTier: [Int : Double] = [1 : 30, 2 : 50, 3 : 70, 4 : 90, 5 : 110]
    let bAbilityAttackSpeedPerTier: [Int : Double] = [1 : 0.1, 2 : 0.2, 3 : 0.3, 4 : 0.4, 5 : 0.5]
    let bAbilityBonusDamageCrystalRatio = 0.8
    
    let ultDamagePerTier: [Int : Double] = [1 : 400, 2 : 550, 3 : 700]
    let ultCpRatio = 2.0
    
    //A ability
    
    var aAbilityNoStackRawDamage: Double {
        let x = aAbilityDamagePerTier[aAbilityTier]! + dataSource.attacker.crystalPower * aAbilityCpRatio
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var aAbilityBonusDamagePerStackRaw: Double {
        let x = aAbilityBonusDamagePerStackPerTier[aAbilityTier]! + dataSource.attacker.crystalPower * aAbilityCpRatio
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var aAbilityFullStackRawDamage: Double {
        return aAbilityNoStackRawDamage + aAbilityBonusDamagePerStackRaw * 5
    }
    
    var aAbilityCooldown: Double {
        return aAbilityCdPerTier[aAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //B ability
    
    var bAbilityHitsPerSec: Double {
        let attackSpeed = dataSource.attacker.attackSpeed + bAbilityAttackSpeedPerTier[bAbilityTier]!
        return attackSpeed / dataSource.attacker.attackCooldown
    }
    
    var bAbilityRawWeaponDPS: Double {
        let weaponPower = dataSource.attacker.weaponPower
        return weaponPower * bAbilityHitsPerSec
    }
    
    var bAbilityRawCrystalDPS: Double {
        let crystalPower = bAbilityBonusDamageCrystalRatio * dataSource.attacker.crystalPower + bAbilityDamagePerTier[bAbilityTier]!
        let dps = crystalPower * bAbilityHitsPerSec
        return dps * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var bAbilityCooldown: Double {
        return bAbilityCdPerTier[bAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //ult
    
    var ultRawDamage: Double {
        let x = ultDamagePerTier[ultTier]! + dataSource.attacker.crystalPower * ultCpRatio
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
}
