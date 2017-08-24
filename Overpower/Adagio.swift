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
    let aAbilityCooldownPerTier: [Int : Double] = [1 : 8, 2 : 8, 3 : 8, 4 : 8, 5 : 8]
    
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
    
    var aAbilityDamage: Double {
        let x = (aAbilityFireDamagePerSec[aAbilityTier]! + dataSource.attacker.crystalPower * 0.2) * aAbilityFireDurationPerTier[aAbilityTier]!
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var aAbilityCooldown: Double {
        return aAbilityCooldownPerTier[aAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    // B ability
    
    var bAbilityBuffDamagePerShotMax: Double {
        let x = bAbilityBuffDamagePerTier[bAbilityTier]! + bAbilityArcaneFireBonusPerTier[bAbilityTier]! + dataSource.attacker.crystalPower * 0.85
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var bAbilityBuffDamagePerShotMin: Double {
        let x =  bAbilityBuffDamagePerTier[bAbilityTier]! + dataSource.attacker.crystalPower * 0.4
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var bAbilitySelfCastTotalDamageMax: Double {
        let basicAttackDamage = BasicAttackDamage(dataSource: dataSource).damage * bAbilityNumberOfAttacksPerTier[bAbilityTier]!
        let x = bAbilityBuffDamagePerTier[bAbilityTier]! + bAbilitySelfCastBonusPerTier[bAbilityTier]! + bAbilityArcaneFireBonusPerTier[bAbilityTier]! + dataSource.attacker.crystalPower * 1.05
        let abilityDamage = DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
        return basicAttackDamage + abilityDamage
    }
    
    var bAbilityMaxDPS: Double {
        return bAbilitySelfCastTotalDamageMax / (bAbilityNumberOfAttacksPerTier[bAbilityTier]! / DPSCalculator(dataSource: dataSource).maxHitsPerSec)
    }
    
    var bAbilitySelfCastTotalDamageMin: Double {
        let basicAttackDamage = BasicAttackDamage(dataSource: dataSource).damage * bAbilityNumberOfAttacksPerTier[bAbilityTier]!
        let x = bAbilityBuffDamagePerTier[bAbilityTier]! + bAbilitySelfCastBonusPerTier[bAbilityTier]! + dataSource.attacker.crystalPower * 0.6
        let abilityDamage = DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
        return basicAttackDamage + abilityDamage
    }
    
    var bAbilityMinDPS: Double {
        return bAbilitySelfCastTotalDamageMin / (bAbilityNumberOfAttacksPerTier[bAbilityTier]! / DPSCalculator(dataSource: dataSource).maxHitsPerSec)
    }
    
    var bAbilityCooldown: Double {
        return bAbilityCooldownPerTier[bAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //ult
    
    var ultDamage: Double {
        let x = ultDamagePerTier[ultTier]! + dataSource.attacker.crystalPower
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var ultFortifiedHealth: Double {
        return ultFortifiedHealthPerTier[ultTier]!
    }
    
}
