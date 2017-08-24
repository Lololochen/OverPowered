//
//  Samuel.swift
//  OverPowered
//
//  Created by yy on 2017/8/15.
//  Copyright © 2017年 Bright Future. All rights reserved.
//

import Foundation

struct Samuel {
    
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
    
    let aAbilityCooldownPerTier: [Int : Double] = [1 : 4 , 2 : 4, 3 : 4, 4 : 4, 5 : 3]
    let aAbilityDamagePerTier: [Int : Double] = [1 : 60, 2 : 90, 3 : 120, 4 : 150, 5 : 210]
    let aAbilityCpRatio = 1.0
    let aAbilityEmpoweredDamagePerTier: [Int : Double] = [1 : 75, 2 : 105, 3 : 135, 4 : 165, 5 : 225]
    let aAbilityEmpoweredDamageCrystalRatio = 1.15
    
    let bAbilityCooldownPerTier: [Int : Double] = [1 : 20, 2 : 20, 3 : 20, 4 : 20, 5 : 20]
    let bAbilityRangePerTier: [Int : Double] = [1 : 14, 2 : 18, 3 : 22, 4 : 26, 5 : 34]
    let bAbilityDpsPerTier: [Int : Double] = [1 : 40, 2 : 55, 3 : 70, 4 : 85, 5 : 100]
    let bAbilityCpRatio = 0.1
    let bAbilityHealPerSecPerTargetPerTier: [Int : Double] = [1 : 2, 2 : 4, 3 : 6, 4 : 8, 5 : 10]
    let bAbilityHealCrystalRatio = 0.1
    
    let ultDamagePerTier: [Int : Double] = [1 : 200, 2 : 325, 3 : 450]
    let ultCpRatio = 1.0
    let ultSleepDurationPerTier: [Int : Double] = [1 : 2, 2 : 2.5, 3 : 3]
    
    //A ability
    
    var aAbilityDamage: Double {
        let x = aAbilityDamagePerTier[aAbilityTier]! + dataSource.attacker.crystalPower * aAbilityCpRatio
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var aAbilityWithEmpoweredDamage: Double {
        let x = aAbilityDamagePerTier[aAbilityTier]! + dataSource.attacker.crystalPower * aAbilityCpRatio
        let empoweredDamage = DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
        return aAbilityDamage + empoweredDamage
    }
    
    var aAbilityCooldown: Double {
        return aAbilityCooldownPerTier[aAbilityTier]! / (1 + dataSource.attacker.cooldownReduction + 3.1)
    }
    
    //B ability
    
    var bAbilityDps: Double {
        let x = bAbilityDpsPerTier[bAbilityTier]! + dataSource.attacker.crystalPower * bAbilityCpRatio
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var bAbilityHealPerSecPerTarget: Double {
        return bAbilityHealPerSecPerTargetPerTier[bAbilityTier]! + bAbilityHealCrystalRatio * dataSource.attacker.crystalPower
    }
    
    var bAbilityHealPerSecPerMinion: Double {
        return bAbilityHealPerSecPerTarget / 2
    }
    
    var bAbilityCooldown: Double {
        return bAbilityCooldownPerTier[bAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //ult
    
    var ultDamage: Double {
        let x = ultDamagePerTier[ultTier]! + dataSource.attacker.crystalPower * ultCpRatio
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var ultSleepDuration: Double {
        return ultSleepDurationPerTier[ultTier]!
    }
}
