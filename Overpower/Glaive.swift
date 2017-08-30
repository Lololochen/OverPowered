//
//  Glaive.swift
//  OverPowered
//
//  Created by yy on 2017/8/11.
//  Copyright © 2017年 Bright Future. All rights reserved.
//

import Foundation

struct Glaive {
    
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
    
    let aAbilityCooldownPerTier: [Int : Double] = [1 : 22, 2 : 20, 3 : 18, 4 : 16, 5 : 12]
    let aAbilityDamagePerTier: [Int : Double] = [1 : 100, 2 : 150, 3 : 200, 4 : 250, 5 : 300]
    let aAbilityCrystalRatio: Double = 1.3
    
    let bAbilityCooldownPerTier: [Int : Double] = [1 : 12, 2 : 11, 3 : 10, 4 : 9, 5 : 8]
    let bAbilityCleaveDamage: [Int : Double] = [1 : 0.3, 2 : 0.35, 3 : 0.4, 4 : 0.45, 5 : 0.65]
    let bAbilityCritChance: [Int : Double] = [1 : 0.09, 2 : 0.13, 3 : 0.17, 4 : 0.21, 5 : 0.25]
    let bAbilityCrystalRatio: Double = 1.3
    
    let ultCdPerTier: [Int : Double] = [1 : 16, 2 : 16, 3 : 16]
    let ultBaseDamagePerTier: [Int : Double] = [1 : 100, 2 : 200, 3 : 300]
    let ultBaseDamageCrystalRatio: Double = 1.1
    let ultDamagePerStackPerTier: [Int : Double] = [1: 10, 2 : 15, 3 : 20]
    let ultDamagePerStackCrystalRatio: Double = 0.02
    
    //A ability
    
    var aAbilityRawDamage: Double {
        let x = aAbilityDamagePerTier[aAbilityTier]! + dataSource.attacker.crystalPower + aAbilityCrystalRatio
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var aAbilityCooldown: Double {
        return aAbilityCooldownPerTier[aAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //B ability
    
    var bAbilityRawDamage: Double {
        let x = dataSource.attacker.crystalPower * bAbilityCrystalRatio
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var bAbilityCooldown: Double {
        return bAbilityCooldownPerTier[bAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //ult
    
    var ultRawDamageWithNoStack: Double {
        let x = ultBaseDamagePerTier[ultTier]! + ultBaseDamageCrystalRatio * dataSource.attacker.crystalPower
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var ultFullStackRawDamage: Double {
        let x = (ultDamagePerStackPerTier[ultTier]! + ultDamagePerStackCrystalRatio * dataSource.attacker.crystalPower) * 20
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var ultCooldown: Double {
        return ultCdPerTier[ultTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
}
