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
    
    let passiveHealCrystalRatio = 0.2
    
    let aAbilityCooldownPerTier: [Int : Double] = [1 : 4, 2 : 3.8, 3 : 3.6, 4 : 3.4, 5 : 3]
    let aAbilityDamagePerTier: [Int : Double] = [1 : 80, 2 : 120, 3 : 160, 4 : 200, 5 : 280]
    let aAbilityDamageCrystalRatio = 1.05
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
    
    var passiveHeal: Double {
        return (70 - 15) / 11 + 15 + passiveHealCrystalRatio * crystalPower
    }
    
    var aAbilityRawCrystalDamage: Double {
        let x = aAbilityDamagePerTier[aAbilityTier]! + crystalPower * aAbilityDamageCrystalRatio
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var aAbilitySplashRawCrystalDamage: Double {
        let x = aAbilitySplashDamagePerTier[aAbilityTier]! + crystalPower * aAbilitySplashDamageCrystalRatio
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var aAbilitySlowFactor: Double {
        return aAbilitySlowDurationPerTier[aAbilityTier]! * aAbilitySlowPerTier[aAbilityTier]!
    }
    
    var aAbilityCooldown: Double {
        return aAbilityCooldownPerTier[aAbilityTier]! / (1 + cdr)
    }
    
    var bAbilityRawCrystalDamage: Double {
        let x = bAbilityDamagePerTier[bAbilityTier]! + crystalPower * bAbilityDamageCrystalRatio
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var bAbilityTetherBreakRawCrystalDamage: Double {
        let x = bAbilityTetherBreakDamagePerTier[bAbilityTier]! + crystalPower * bAbilityTetherBreakDamageCrystalRatio
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var bAbilityCooldown: Double {
        return bAbilityCooldownPerTier[bAbilityTier]! / (1 + cdr)
    }
    
    var ultTotalRawCrystalDamage: Double {
        let x = ultDPSPerTier[ultTier]! + crystalPower * ultDPSCrystalRatio
        let y = x * ultFearDuration
        return y  * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var ultFearDuration: Double {
        return ultFearDurationPerTier[ultTier]!
    }
    
}
