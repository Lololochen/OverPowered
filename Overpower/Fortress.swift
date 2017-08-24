//
//  Fortress.swift
//  OverPowered
//
//  Created by yy on 2017/8/11.
//  Copyright © 2017年 Bright Future. All rights reserved.
//

import Foundation

struct Fortress {
    
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
    
    let aAbilityCdPerTier: [Int : Double] = [1 : 11, 2 : 10, 3 : 9, 4 : 8, 5 : 7]
    let aAbilityDamagePerTier: [Int : Double] = [1 : 20, 2 : 60, 3 : 100, 4 : 140, 5 : 220]
    let aAbilitySpeedBoostPerTier: [Int : Double] = [1 : 2, 2 : 2, 3 : 2, 4 : 2, 5 : 3]
    let aAbilityDurationPerTier: [Int : Double] = [1 : 2, 2 : 2, 3 : 2, 4 : 2, 5 : 3]
    let aAbilityLifeStealPerTier: [Int : Double] = [1 : 0.1, 2 : 0.12, 3 : 0.14, 4 : 0.16, 5 : 0.2]
    
    let bAbilityCdPerTier: [Int : Double] = [1 : 11, 2 : 10, 3 : 9, 4 : 8, 5 : 6]
    let bAbilityDamagePerTier: [Int : Double] = [1 : 70, 2 : 115, 3 : 160, 4 : 205, 5 : 250]
    let bAbilityPercentMaxHealthDamagePerTier: [Int : Double] = [1 : 0.1, 2 : 0.12, 3 : 0.14, 4 : 0.16, 5 : 0.2]
    
    let ultDurationPerTier: [Int : Double] = [1 : 10, 2 : 12, 3 : 14]
    let ultAttackSpeedIncreasePerTier: [Int : Double] = [1 : 0.3, 2 : 0.45, 3 : 0.6]
    let ultFortifiedHealthPerTier: [Int : Double] = [1 : 300, 2 : 425, 3 : 550]
    let ultWolfAttackDamagePerTier: [Int : Double] = [1 : 20, 2 : 40, 3 : 60]
    let ultWolfBaseHealthPerTier: [Int : Double] = [1 : 300, 2 : 425, 3 : 550]
    
    //A ability
    
    var aAbilityDamage: Double {
        let x = aAbilityDamagePerTier[aAbilityTier]! + dataSource.attacker.crystalPower * 1.1
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var aAbilitySpeedBoost: Double {
        return aAbilitySpeedBoostPerTier[aAbilityTier]!
    }
    
    var aAbilityDuration: Double {
        return aAbilityDurationPerTier[aAbilityTier]!
    }
    
    var aAbilityLifeSteal: Double {
        return aAbilityLifeStealPerTier[aAbilityTier]!
    }
    
    var aAbilityCooldown: Double {
        return aAbilityCdPerTier[aAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //B ability
    
    var bAbilityDamage: Double {
        let x = bAbilityDamagePerTier[bAbilityTier]! + dataSource.attacker.crystalPower * 0.7
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var bAbilityFullStackDamage: Double {
        let x = (bAbilityPercentMaxHealthDamagePerTier[bAbilityTier]!) * dataSource.defender.health + dataSource.attacker.crystalPower * 0.05
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var bAbilityCooldown: Double {
        return bAbilityCdPerTier[bAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //ult
    
    var ultDuration: Double {
        return ultDurationPerTier[ultTier]!
    }
    
    var ultAttackSpeedIncrease: Double {
        return ultAttackSpeedIncreasePerTier[ultTier]!
    }
    
    var ultFortifiedHealth: Double {
        return ultFortifiedHealthPerTier[ultTier]!
    }
    
    var ultBleedDamagePerSec: Double {
        let x = 10 + dataSource.attacker.crystalPower * 0.15
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var ultWolfDPS: Double {
        let x = ultWolfAttackDamagePerTier[ultTier]!
        return DamageCalculator(dataSource: dataSource).receivedWeaponDamage(x)
    }
    
    var ultDpsPerWolf: Double {
        return ultBleedDamagePerSec + ultWolfDPS
    }
    
    var ultBleedingStackAppliedPerSec: Double {
        return 1
    }
}
