//
//  Krul.swift
//  OverPowered
//
//  Created by yy on 2017/8/12.
//  Copyright © 2017年 Bright Future. All rights reserved.
//

import Foundation

struct Krul {
    
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
    
    let aAbilityCdPerTier: [Int : Double] = [1 : 9, 2 : 9, 3 : 9, 4 : 9, 5 : 8]
    let aAbilityBarrierPerTier: [Int : Double] = [1 : 100, 2 : 180, 3 : 260, 4 : 340, 5 : 420]
    let aAbilityCpRatio = 0.7
    let aAbilityBarrierCrystalRatio = 1.25
   
    let bAbilityCdPerTier: [Int : Double] = [1 : 13, 2 : 12.5, 3 : 12, 4 : 11.5, 5 : 10]
    let bAbilityDamagePerTier: [Int : Double] = [1 : 100, 2 : 150, 3 : 200, 4 : 250, 5 : 350]
    let bAbilityCpRatio = 0.5
    let bAbilityDamagePerStackPerTier: [Int : Double] = [1 : 20, 2 : 35, 3 : 50, 4 : 65, 5 : 95]
    let bAbilityDamagePerStackCrystalRatio = 0.2
    let bAbilityHealPerTier: [Int : Double] = [1 : 40, 2 : 60, 3 : 80, 4 : 100, 5 : 140]
    let bAbilityHealCrystalRatio = 0.35
    let bAbilityHealPerStackPerTier: [Int : Double] = [1 : 15, 2 : 20, 3 : 25, 4 : 30, 5 : 40]
    let bAbilityHealPerStackCrystalRatio = 0.2
    
    let ultDamagePerTier: [Int : Double] = [1 : 350, 2 : 500, 3 : 650]
    let ultCpRatio = 1.0
    let ultSlowDurationPerTier: [Int : Double] = [1 : 3, 2 : 3.5, 3 : 4]
    let ultStunDurationPerTier: [Int : Double] = [1 : 1.8, 2 : 2, 3 : 2.2]
    
    //A ability
    
    var aAbilityDamage: Double {
        let x = dataSource.attacker.crystalPower * aAbilityCpRatio
        let bonusCrystalDamage = DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
        let basicAttackDamage = BasicAttackDamage(dataSource: dataSource).damage
        return bonusCrystalDamage + basicAttackDamage
    }
    
    var aAbilityBarrier: Double {
        return aAbilityBarrierPerTier[aAbilityTier]!
    }
    
    var aAbilityCooldown: Double {
        return aAbilityCdPerTier[aAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //B ability
    
    var bAbilityWeaknessDuration: Double {
        return 4 + dataSource.attacker.crystalPower * 0.005
    }
    
    var bAbilityNoStackDamage: Double {
        let x = bAbilityDamagePerTier[bAbilityTier]! + dataSource.attacker.crystalPower * bAbilityCpRatio
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var bAbilityNoStackHeal: Double {
        return bAbilityHealPerTier[bAbilityTier]! + dataSource.attacker.crystalPower * bAbilityHealCrystalRatio
    }
    
    var bAbilityDamagePerStack: Double {
        let x = bAbilityDamagePerStackPerTier[bAbilityTier]! + dataSource.attacker.crystalPower * bAbilityDamagePerStackCrystalRatio
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var bAbilityHealPerStack: Double {
        return bAbilityHealPerStackPerTier[bAbilityTier]! + dataSource.attacker.crystalPower * bAbilityHealPerStackCrystalRatio
    }
    
    var bAbilityThreeStackDamage: Double {
        return bAbilityDamagePerStack * 4 + bAbilityNoStackDamage
    }
    
    var bAbilityFullStackDamage: Double {
        return bAbilityDamagePerStack * 8 + bAbilityNoStackDamage
    }
    
    var bAbilityThreeStackHeal: Double {
        return bAbilityHealPerStack * 4 + bAbilityNoStackHeal
    }
    
    var bAbilityFullStackHeal: Double {
        return bAbilityHealPerStack * 8 + bAbilityNoStackHeal
    }
    
    var bAbilityCooldown: Double {
        return bAbilityCdPerTier[bAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //ult
    
    var ultDamage: Double {
        let x = ultDamagePerTier[ultTier]! + dataSource.attacker.crystalPower * ultCpRatio
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var ultMaxStunDuration: Double {
        return ultStunDurationPerTier[ultTier]! * 1.5
    }
    
    var ultMinStunDuration: Double {
        return ultStunDurationPerTier[ultTier]! * 0.5
    }
    
    var ultMaxStunPlusSlowDuration: Double {
        return ultMaxStunDuration + ultSlowDurationPerTier[ultTier]! * 1.5
    }
    
    var ultMinStunPlusSlowDuration: Double {
        return ultMinStunDuration + ultSlowDurationPerTier[ultTier]! * 0.5
    }
}
