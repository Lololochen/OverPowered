//
//  Flicker.swift
//  OverPowered
//
//  Created by yy on 2017/8/11.
//  Copyright © 2017年 Bright Future. All rights reserved.
//

import Foundation

struct Flicker {
    
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
    
    let aAbilityCdPerTier: [Int : Double] = [1 : 6, 2 : 5.5, 3 : 5, 4 : 4.5, 5 : 4]
    let aAbilityDpsPerTier: [Int : Double] = [1 : 75, 2 : 150, 3 : 225, 4 : 300, 5 : 375]
    let aAbilityCpRatio = 0.25
    let aAbilityRootDurationPerTier: [Int : Double] = [1 : 1, 2 : 1, 3 : 1, 4 : 1, 5 : 1.5]
  
    let bAbilityCdPerTier: [Int : Double] = [1 : 15, 2 : 14, 3 : 13, 4 : 12, 5 : 11]
    let bAbilitySlowPerTier: [Int : Double] = [1 : 0.35, 2 : 0.40, 3 : 0.45, 4 : 0.5, 5 : 0.6]
    let bAbilityDpsPerTier: [Int : Double] = [1 : 30, 2 : 60, 3 : 90, 4 : 120, 5 : 180]
    let bAbilityDpsCrystalRatio = 0.5
    let bAbilityDetonateDamagePerTier: [Int : Double] = [1 : 60, 2 : 120, 3 : 180, 4 : 240, 5 : 360]
    let bAbilityDetonateDamageCrystalRatio = 1.0
    
    //A ability
    
    var aAbilityDps: Double {
        let x = aAbilityDpsPerTier[aAbilityTier]! + dataSource.attacker.crystalPower * aAbilityCpRatio
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var aAbilityCooldown: Double {
        return aAbilityCdPerTier[aAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //B ability

    var bAbilityDps: Double {
        let x = bAbilityDpsPerTier[bAbilityTier]! + dataSource.attacker.crystalPower * bAbilityDpsCrystalRatio
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var bAbilityDetonateDamage: Double {
        let x = bAbilityDetonateDamagePerTier[bAbilityTier]! + dataSource.attacker.crystalPower * bAbilityDpsCrystalRatio
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var bAbilityTotalDamage: Double {
        return bAbilityDps * 3 + bAbilityDetonateDamage
    }
    
    var bAbilitySlowStrength: Double {
        return bAbilitySlowPerTier[bAbilityTier]!
    }
    
    var bAbilityCooldown: Double {
        return bAbilityCdPerTier[bAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
}
