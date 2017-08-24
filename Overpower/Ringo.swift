//
//  Ringo.swift
//  OverPowered
//
//  Created by yy on 2017/8/15.
//  Copyright © 2017年 Bright Future. All rights reserved.
//

import Foundation

struct Ringo {
    
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
    
    let aAbilityDamagePerTier: [Int : Double] = [1 : 40, 2 : 50, 3 : 60, 4 : 70, 5 : 350]
    let aAbilitySlowStrengthPerTier: [Int : String] = [1 : "30%", 2 : "35%", 3 : "40%", 4 : "45%", 5 : "50%"]
    let aAbilitySlowDurationPerTier: [Int : Double] = [1 : 1.5, 2 : 1.5, 3 : 1.5, 4 : 1.5, 5 : 2.5]
    let aAbilityCooldownPerTier: [Int : Double] = [1 : 9, 2 : 8.5, 3 : 8, 4 : 7.5, 5 : 7]
    
    let bAbilityAttackSpeedIncrease: [Int : Double] = [1 : 0.15, 2 : 0.25, 3 : 0.35, 4 : 0.45, 5 : 0.65]
    let bAbilityMoveSpeedIncrease: [Int : Double] = [1 : 0.75, 2 : 0.8, 3 : 0.85, 4 : 0.9, 5 : 1]
    let bAbilityCooldownPerTier: [Int : Double] = [1 : 9, 2 : 9, 3 : 9, 4 : 9, 5 : 9]

    let ultImpactDamagePerTier: [Int : Double] = [1 : 250, 2 : 365, 3 : 480]
    let ultBurnDamagePerTier: [Int : Double] = [1 : 30, 2 : 50, 3 : 70]
    
    //A ability
    
    var aAbilityDamage: Double {
        let crystalPower = dataSource.attacker.crystalPower
        let x = aAbilityDamagePerTier[aAbilityTier]! + crystalPower * 1.25
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var aAbilitySlowStrength: String {
        return aAbilitySlowStrengthPerTier[aAbilityTier]!
    }
    
    var aAbilitySlowDuration: Double {
        return aAbilitySlowDurationPerTier[aAbilityTier]!
    }
    
    var aAbilityCooldown: Double {
        return aAbilityCooldownPerTier[aAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //B ability
    
    var bAbilityOriginalDamagePerHit: Double {
        return BasicAttackDamage(dataSource: dataSource).damage
    }
    
    var bAbilityBuffDamagePerHit: Double {
        let x = dataSource.attacker.crystalPower * 0.8
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var bAbilityMaxHitsPerSecond: Double {
        return (dataSource.attacker.attackSpeed + bAbilityAttackSpeedIncrease[bAbilityTier]!) / Hero.ringo.attackCooldown
    }
    
    var bAbilityDps: Double {
        let damagePerHit = bAbilityOriginalDamagePerHit + bAbilityBuffDamagePerHit
        return damagePerHit * bAbilityMaxHitsPerSecond
    }
    
    var bAbilityTotalDamage: Double {
        return bAbilityDps * 6
    }
    
    var bAbilityCooldown: Double {
        return bAbilityCooldownPerTier[bAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    var bAbilityHeroicPerkBonusDamage: Double {
        return BasicAttackDamage(dataSource: dataSource).critDamage - BasicAttackDamage(dataSource: dataSource).weaponDamagePerHit
    }
    
    //ult
    
    var ultImpactDamage: Double {
        let piercedDamage = ultImpactDamagePerTier[ultTier]! + dataSource.attacker.crystalPower * 0.75
        return piercedDamage * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var ultBurnDamage: Double {
        let piercedDamage = ultBurnDamagePerTier[ultTier]! + dataSource.attacker.crystalPower * 0.2 * 7
        return piercedDamage * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var ultTotalDamage: Double {
        return ultImpactDamage + ultBurnDamage
    }
}
