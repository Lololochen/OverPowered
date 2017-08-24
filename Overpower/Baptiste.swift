//
//  Baptiste.swift
//  OverPowered
//
//  Created by Bright Future on 29/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

struct Baptiste {
    
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
    var crystalPower: Double {
        return dataSource.attacker.crystalPower
    }
    var cdr: Double {
        return dataSource.attacker.cooldownReduction
    }
    
    let aAbilityCooldownPerTier: [Int : Double] = [1 : 4, 2 : 3.8, 3 : 3.6, 4 : 3.4, 5 : 3]
    let aAbilityDamagePerTier: [Int : Double] = [1 : 80, 2 : 120, 3 : 160, 4 : 200, 5 : 280]
    let aAbilityDamageCrystalRatio = 1.1
    let aAbilitySplashDamagePerTier: [Int : Double] = [1 : 40, 2 : 60, 3 : 80, 4 : 100, 5 : 140]
    let aAbilitySplashDamageCrystalRatio = 0.55
    let aAbilitySlowPerTier: [Int : Double] = [1 : 0.6, 2 : 0.6, 3 : 0.6, 4 : 0.6, 5 : 0.6]
    let aAbilitySlowDurationPerTier: [Int : Double] = [1 : 0.8, 2 : 0.8, 3 : 0.8, 4 : 0.8, 5 : 1.2]
    let aAbilityRange = 7.0
    
    let bAbilityCooldownPerTier: [Int : Double] = [1 : 16, 2 : 15, 3 : 14, 4 : 13, 5 : 12]
    let bAbilityDamagePerTier: [Int : Double] = [1 : 45, 2 : 75, 3 : 105, 4 : 135, 5 : 195]
    let bAbilityDamageCrystalRatio = 0.45
    let bAbilityDurationPerTier: [Int : Double] = [1 : 2.5, 2 : 2.5, 3 : 2.5, 4 : 2.5, 5 : 2.5]
    let bAbilityTetherBreakDamagePerTier: [Int : Double] = [1 : 60, 2 : 100, 3 : 140, 4 : 180, 5 : 260]
    let bAbilityTetherBreakDamageCrystalRatio = 0.6
    let bAbilityStunDurationPerTier: [Int : Double] = [1 : 1.2, 2 : 1.2, 3 : 1.2, 4 : 1.2, 5 : 1.2]
    let bAbilityRange = 5.0
    
    let ultDPSPerTier: [Int : Double] = [1 : 100, 2 : 125, 3 : 150]
    let ultDPSCrystalRatio = 0.65
    let ultFearDurationPerTier: [Int : Double] = [1 : 1, 2 : 1.3, 3 : 1.6]
    let ultRange = 22.0
    
    var passiveFullStackHeal: Double {
        return (70 - 15) / 11 + 15 + 0.8 * crystalPower
    }
    
    var aAbilityDamage: Double {
        let x = aAbilityDamagePerTier[aAbilityTier]! + crystalPower * aAbilityDamageCrystalRatio
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var aAbilitySplashDamage: Double {
        let x = aAbilitySplashDamagePerTier[aAbilityTier]! + crystalPower * aAbilitySplashDamageCrystalRatio
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var aAbilitySlowDistance: Double {
        return dataSource.defender.moveSpeed * aAbilitySlowDurationPerTier[aAbilityTier]! * aAbilitySlowPerTier[aAbilityTier]!
    }
    
    var aAbilityCooldown: Double {
        return aAbilityCooldownPerTier[aAbilityTier]! / (1 + cdr)
    }
    
    var bAbilityDamage: Double {
        let x = bAbilityDamagePerTier[bAbilityTier]! + crystalPower * bAbilityDamageCrystalRatio
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var bAbilityFullDamage: Double {
        let x = bAbilityTetherBreakDamagePerTier[bAbilityTier]! + crystalPower * bAbilityTetherBreakDamageCrystalRatio
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var bAbilityDuration: Double {
        return bAbilityDurationPerTier[bAbilityTier]!
    }
    
    var bAbilityStunDuration: Double {
        return bAbilityStunDurationPerTier[bAbilityTier]!
    }
    
    var bAbilityCooldown: Double {
        return bAbilityCooldownPerTier[bAbilityTier]! / (1 + cdr)
    }
    
    var ultTotalDamage: Double {
        let x = ultDPSPerTier[ultTier]! + crystalPower * ultDPSCrystalRatio
        let y = x * ultFearDuration
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(y)
    }
    
    var ultFearDuration: Double {
        return ultFearDurationPerTier[ultTier]!
    }
    
}
