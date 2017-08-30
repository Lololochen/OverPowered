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
    
    let aAbilityCdPerTier: [Int : Double] = [1 : 8, 2 : 8, 3 : 8, 4 : 8, 5 : 7]
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
    
    var aAbilityRawWeaponDamage: Double {
        let originalDamage = BasicAttackDamage(dataSource: dataSource).rawWeaponDamagePerHit
        return originalDamage * 1.6
    }
    
    var aAbilityRawCrystalDamage: Double {
        let x = dataSource.attacker.crystalPower * aAbilityCpRatio
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var aAbilityBarrier: Double {
        return aAbilityBarrierPerTier[aAbilityTier]!
    }
    
    var aAbilityCooldown: Double {
        return aAbilityCdPerTier[aAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //B ability
    
    var bAbilityNoStackRawDamage: Double {
        let x = bAbilityDamagePerTier[bAbilityTier]! + dataSource.attacker.crystalPower * bAbilityCpRatio
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var bAbilityRawDamagePerStack: Double {
        let x = bAbilityDamagePerStackPerTier[bAbilityTier]! + dataSource.attacker.crystalPower * bAbilityDamagePerStackCrystalRatio
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var bAbilityFullStackRawDamage: Double {
        return bAbilityRawDamagePerStack * 8 + bAbilityNoStackRawDamage
    }
    
    var bAbilityNoStackHeal: Double {
        return bAbilityHealPerTier[bAbilityTier]! + dataSource.attacker.crystalPower * bAbilityHealCrystalRatio
    }
    
    var bAbilityHealPerStack: Double {
        return bAbilityHealPerStackPerTier[bAbilityTier]! + dataSource.attacker.crystalPower * bAbilityHealPerStackCrystalRatio
    }
    
    var bAbilityFullStackHeal: Double {
        return bAbilityHealPerStack * 8 + bAbilityNoStackHeal
    }
    
    var bAbilityWeaknessDuration: Double {
        return 4 + dataSource.attacker.crystalPower * 0.005
    }
    
    var bAbilityCooldown: Double {
        return bAbilityCdPerTier[bAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //ult
    
    var ultRawDamage: Double {
        let x = ultDamagePerTier[ultTier]! + dataSource.attacker.crystalPower * ultCpRatio
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
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
