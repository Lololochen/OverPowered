//
//  Lyra.swift
//  OverPowered
//
//  Created by yy on 2017/8/12.
//  Copyright © 2017年 Bright Future. All rights reserved.
//

import Foundation

struct Lyra {
    
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
    
    let aAbilityCdPerTier: [Int : Double] = [1 : 14, 2 : 12.5, 3 : 11, 4 : 9.5, 5 : 8]
    let aAbilityDamagePerSecPerTier: [Int : Double] = [1 : 60, 2 : 100, 3 : 140, 4 : 180, 5 : 260]
    let aAbilityHealPerSecPerTier: [Int : Double] = [1 : 40, 2 : 60, 3 : 80, 4 : 100, 5 : 140]
    let aAbilityDetonateDamagePerTier: [Int : Double] = [1 : 75, 2 : 125, 3 : 175, 4 : 225, 5 : 325]
    
    let bAbilityCooldownPerTier: [Int : Double] = [1 : 24, 2 : 22, 3 : 20, 4 : 18, 5 : 14]
    let bAbilityDamagePerTier: [Int : Double] = [1 : 50, 2 : 125, 3 : 200, 4 : 275, 5 : 350]
    let bAbilityCpRatio = 0.5
    
    let ultRangePerTier: [Int : Double] = [1 : 9, 2 : 10, 3 : 13]
    
    //A ability
    
    var aAbilityRawDps: Double {
        let x = aAbilityDamagePerSecPerTier[aAbilityTier]! + dataSource.attacker.crystalPower * 0.8
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var aAbilityHealPerSec: Double {
        return aAbilityHealPerSecPerTier[aAbilityTier]! + dataSource.attacker.buildPower.health * 0.12
    }
    
    var aAbilityMaxHeal: Double {
        return aAbilityHealPerSec * 2.5
    }
    
    var aAbilityDetonateRawDamage: Double {
        let x = aAbilityDetonateDamagePerTier[aAbilityTier]! + dataSource.attacker.crystalPower * 1.2
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var aAbilityCooldown: Double {
        return aAbilityCdPerTier[aAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //B ability
    
    var bAbilityRawDamage: Double {
        let x = bAbilityDamagePerTier[bAbilityTier]! + dataSource.attacker.crystalPower * bAbilityCpRatio
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var bAbilityCooldown: Double {
        return bAbilityCooldownPerTier[bAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
}
