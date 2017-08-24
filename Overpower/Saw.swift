//
//  Saw.swift
//  OverPowered
//
//  Created by yy on 2017/8/15.
//  Copyright © 2017年 Bright Future. All rights reserved.
//

import Foundation

struct Saw {
    
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
    
    let aAbilityCdPerTier: [Int : Double] = [1 : 15, 2 : 14, 3 : 13, 4 : 12, 5 : 11]
    let aAbilityDamagePerTier: [Int : Double] = [1 : 60, 2 : 140, 3 : 220, 4 : 300, 5 : 380]
    let aAbilityCpRatio = 2.8
    let aAbilityMissingHealthDamagePerTier: [Int : Double] = [1 : 0.2, 2 : 0.25, 3 : 0.3, 4 : 0.35, 5 : 0.45]
    let aAbilitySpeedBoosCrystalRatio = 0.015
    
    let bAbilityCdPerTier: [Int : Double] = [1 : 15, 2 : 15, 3 : 15, 4 : 15, 5 : 15]
    let bAbilityDamagePerTier: [Int : Double] = [1 : 240, 2 : 360, 3 : 480, 4 : 600, 5 : 960]
    let bAbilityCpRatio = 4.0
    let bAbilitySlowDurationPerTier:[Int : Double] = [1 : 2, 2 : 2, 3 : 2, 4 : 2, 5 : 2.5]
    
    let ultDamagePerTier: [Int : Double] = [1 : 40, 2 : 60, 3 : 80]
    let ultCpRatio = 1.4
    
    //A ability
    
    var aAbilityDamageOnFullHealthEnemy: Double {
        let x = aAbilityDamagePerTier[aAbilityTier]! + dataSource.attacker.crystalPower * aAbilityCpRatio
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    func aAbilityCalcDamageWithHealthPercentage(percentage: Double) -> Double {
        let x = dataSource.attacker.weaponPower * 0.2 + aAbilityMissingHealthDamagePerTier[aAbilityTier]! * (1 - percentage) * dataSource.defender.health
        let missingHealthDamage = DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
        
        return aAbilityDamageOnFullHealthEnemy + missingHealthDamage
    }
    
    var aAbilityExecutableHealthPercentage: Double {
        let b = (1 - dataSource.attacker.shieldPierce) / (1 + dataSource.defender.shieldPierce / 100)
        let c = aAbilityMissingHealthDamagePerTier[aAbilityTier]! * dataSource.defender.health
        let pierce = dataSource.attacker.shieldPierce
        let health = dataSource.defender.health
        return (aAbilityDamageOnFullHealthEnemy + b * c + c * pierce) / (health + c * pierce + b * c)
    }
    
    var aAbilitySpeedBoost: Double {
        let boost = 2.5 + dataSource.attacker.crystalPower * aAbilitySpeedBoosCrystalRatio
        return (boost > 3.2) ? 3.2 : boost
    }
    
    var aAbilityCooldown: Double {
        return aAbilityCdPerTier[aAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //B ability
    
    var bAbilityTotalDamage: Double {
        let x = bAbilityDamagePerTier[bAbilityTier]! + dataSource.attacker.crystalPower * bAbilityCpRatio
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var bAbilitySlowDuration: Double {
        return bAbilitySlowDurationPerTier[bAbilityTier]!
    }
    
    var bAbilityCooldown: Double {
        return bAbilityCdPerTier[bAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //ult
    
}
