//
//  Adagio.swift
//  OverPowered
//
//  Created by yy on 2017/8/9.
//  Copyright © 2017年 Bright Future. All rights reserved.
//

import Foundation

struct Adagio {
    
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
    
    let aAbilityFireDurationPerTier: [Int : Double] = [1 : 5, 2 : 5.5, 3 : 6, 4 : 6.5, 5 : 7]
    let aAbilityFireDamagePerSec : [Int : Double] = [1 : 20, 2 : 20, 3 : 40, 4 : 50, 5 : 70]
    let aAbilityInstantHeal: [Int : Double] = [1 : 40, 2 : 60, 3 : 80, 4 : 100, 5 : 140]
    let aAbilityHealPerSec: [Int : Double] = [1 : 15, 2 : 20, 3 : 25, 4 : 30, 5 : 35]
    let aAbilityCooldownPerTier: [Int : Double] = [1 : 10, 2 : 9.5, 3 : 9.5, 4 : 8, 5 : 8]
    
    let bAbilityCooldownPerTier: [Int : Double] = [1 : 10, 2 : 10, 3 : 10, 4 : 10, 5 : 10]
    let bAbilityNumberOfAttacksPerTier: [Int : Double] = [1 : 5, 2 : 5, 3 : 5, 4 : 5, 5 : 7]
    let bAbilityBuffDamagePerTier: [Int : Double] = [1 : 20, 2 : 40, 3 : 60, 4 : 80, 5 : 120]
    let bAbilityArcaneFireBonusPerTier: [Int : Double] = [1 : 5, 2 : 15, 3 : 25, 4 : 35, 5 : 55]
    let bAbilitySelfCastBonusPerTier: [Int : Double] = [1 : 5, 2 : 10, 3 : 15, 4 : 20, 5 : 30]
    
    let ultDamagePerTier: [Int : Double] = [1 : 500, 2 : 900, 3 : 1300]
    let ultFortifiedHealthPerTier: [Int : Double] = [1 : 100, 2 : 175, 3 : 250]
    let ultStunDuration = 2.2
    
    //A ability
    
    var aAbilityHeal: Double {
        let instantHeal = self.aAbilityInstantHeal[aAbilityTier]! + dataSource.attacker.buildPower.health * 0.1 + dataSource.attacker.crystalPower
        let slowHeal = (aAbilityHealPerSec[aAbilityTier]! + 0.1 * dataSource.attacker.crystalPower) * 3
        return instantHeal + slowHeal
    }
    
    var aAbilityFireDuration: Double {
        return aAbilityFireDurationPerTier[aAbilityTier]!
    }
    
    var aAbilityRawDamage: Double {
        let x = (aAbilityFireDamagePerSec[aAbilityTier]! + dataSource.attacker.crystalPower * 0.2) * aAbilityFireDurationPerTier[aAbilityTier]!
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var aAbilityCooldown: Double {
        return aAbilityCooldownPerTier[aAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    // B ability
    
    var bAbilitySelfCastTotalRawDamageMax: Double {
        let x = bAbilityBuffDamagePerTier[bAbilityTier]! + bAbilitySelfCastBonusPerTier[bAbilityTier]! + bAbilityArcaneFireBonusPerTier[bAbilityTier]! + dataSource.attacker.crystalPower * 1.05
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    // self cast, target on fire
    var bAbilityMaxRawCrystalDPS: Double {
        let abilityDamage = bAbilitySelfCastTotalRawDamageMax / (bAbilityNumberOfAttacksPerTier[bAbilityTier]! / BasicAttackDamage(dataSource: dataSource).maxHitsPerSec)
        let basicAttackCrystalDPS = BasicAttackDamage(dataSource: dataSource).rawCrystalDPS
        return abilityDamage + basicAttackCrystalDPS
    }
    
    var bAbilitySelfCastTotalRawDamageMin: Double {
        let x = bAbilityBuffDamagePerTier[bAbilityTier]! + bAbilitySelfCastBonusPerTier[bAbilityTier]! + dataSource.attacker.crystalPower * 0.6
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    // self cast, target not on fire
    var bAbilityMinRawCrystalDPS: Double {
        let abilityDamage = bAbilitySelfCastTotalRawDamageMin / (bAbilityNumberOfAttacksPerTier[bAbilityTier]! / BasicAttackDamage(dataSource: dataSource).maxHitsPerSec)
        let basicAttackCrystalDPS = BasicAttackDamage(dataSource: dataSource).rawCrystalDPS
        return abilityDamage + basicAttackCrystalDPS
    }
    
    var bAbilityCooldown: Double {
        return bAbilityCooldownPerTier[bAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //ult
    
    var ultRawDamage: Double {
        let x = ultDamagePerTier[ultTier]! + dataSource.attacker.crystalPower
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
}
