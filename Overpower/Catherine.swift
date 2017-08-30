//
//  Catherine.swift
//  OverPowered
//
//  Created by yy on 2017/8/11.
//  Copyright © 2017年 Bright Future. All rights reserved.
//

import Foundation

struct Catherine {
    
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
    
    let aAbilityCdPerTier: [Int : Double] = [1 : 14, 2 : 13.5, 3 : 13, 4 : 12.5, 5 : 12]
    let aAbilityEnergyCostPerTier: [Int : Double] = [1 : 40, 2 : 50, 3 : 60, 4 : 70, 5 : 90]
    let aAbilityCpRatio = 1.0
    let aAbilityDamagePerTier: [Int : Double] = [1 : 35, 2 : 60, 3 : 85, 4 : 110, 5 : 135]
    let aAbilityStunDurationPerTier: [Int : Double] = [1 : 1, 2 : 1, 3 : 1, 4 : 1, 5 : 1]
    
    let bAbilityCdPerTier: [Int : Double] = [1 : 7, 2 : 6.5, 3 : 6, 4 : 5.5, 5 : 5]
    let bAbilityDpsPerTier: [Int : Double] = [1 : 40, 2 : 60, 3 : 80, 4 : 100, 5 : 120]
    let bAbilityCpRatio = 0.5
    let bAbilityBonusReflectPerTier: [Int : Double] = [1 : 0, 2 : 0.05, 3 : 0.1, 4 : 0.15, 5 : 0.25]
    
    let ultDamagePerTier: [Int : Double] = [1 : 350, 2 : 500, 3 : 650]
    let ultSilenceDurationPerTier: [Int : Double] = [1 : 2.2, 2 : 2.5, 3 : 2.8]
    let ultCpRatio = 1.3
    
    //A ability
    var aAbilityRawCrystalDamage: Double {
        let x = aAbilityDamagePerTier[aAbilityTier]! + dataSource.attacker.crystalPower * aAbilityCpRatio
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var aAbilityCooldown: Double {
        return aAbilityCdPerTier[aAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //B ability
    
    var bAbilityRawDps: Double {
        let x = bAbilityDpsPerTier[bAbilityTier]! + dataSource.attacker.crystalPower * bAbilityCpRatio
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var bAbilityMinimumReflexableDamage: Double {
        return 0.1 * dataSource.attacker.health
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
