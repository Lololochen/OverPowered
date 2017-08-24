//
//  Lance.swift
//  OverPowered
//
//  Created by yy on 2017/8/12.
//  Copyright © 2017年 Bright Future. All rights reserved.
//

import Foundation

struct Lance {
    
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
    
    let aAbilityCooldownPerTier: [Int : Double] = [1 : 12, 2 : 11, 3 : 10, 4 : 9, 5 : 7]
    let aAbilityDamagePerTier: [Int : Double] = [1 : 120, 2 : 230, 3 : 340, 4 : 450, 5 : 560]
    let aAbilityRootDurationPerTier: [Int : Double] = [1 : 1, 2 : 1, 3 : 1, 4 : 1, 5 : 1.2]
    let aAbilityWpRatio = 1.4
    let aAbilityCpRatio = 0.8
    let aAbilityRootDurationCrystalRatio = 0.002
    
    let bAbilityCooldownPerTier: [Int : Double] = [1 : 9, 2 : 8.5, 3 : 8, 4 : 7.5, 5 : 7]
    let bAbilityDamagePerTier: [Int : Double] = [1 : 70, 2 : 105, 3 : 140, 4 : 175, 5 : 210]
    let bAbilityStunDurationPerTier: [Int : Double] = [1 : 0.6, 2 : 0.7, 3 : 0.8, 4 : 0.9, 5 : 1]
    let bAbilityPassiveDamageReductionPerTier: [Int : Double] = [1 : 0.1, 2 : 0.12, 3 : 0.14, 4 : 0.16, 5 : 0.2]
    let bAbilityActiveDamageReductionPerTier: [Int : Double] = [1 : 0.25, 2 : 0.3, 3 : 0.35, 4 : 0.4, 5 : 0.45]
    let bAbilityWpRatio = 1.0
    let bAbilityCpRatio = 0.8
    let bAbilityStunCrystalRatio = 0.002
    let bAbilityPassiveDamageReductionCrystalRatio = 0.15
    let bAbilityActiveDamageReductionCrystalRatio = 0.15
    
    let ultCdPerTier: [Int : Double] = [1 : 8, 2 : 6, 3 : 4]
    let ultDamagePerTier: [Int : Double] = [1 : 125, 2 : 200, 3 : 275]
    let ultCpRatio = 0.6
    
    //A ability
    
    var aAbilityDamage: Double {
        let weaponStrength = aAbilityDamagePerTier[aAbilityTier]! + dataSource.attacker.buildPower.weaponPower * aAbilityWpRatio
        let weaponDamage = DamageCalculator(dataSource: dataSource).receivedWeaponDamage(weaponStrength)
        let crystalStrength = dataSource.attacker.crystalPower * aAbilityCpRatio
        let crystalDamage = DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(crystalStrength)
        return weaponDamage + crystalDamage
    }
    
    var aAbilityRootDuration: Double {
        let duration = aAbilityRootDurationPerTier[aAbilityTier]! + dataSource.attacker.crystalPower * aAbilityRootDurationCrystalRatio
        return (duration > 1.6) ? 1.6 : duration
    }
    
    var aAbilityCooldown: Double {
        return aAbilityCooldownPerTier[aAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //B ability
    
    var bAbilityDamage: Double {
        let weaponStrength = bAbilityDamagePerTier[bAbilityTier]! + dataSource.attacker.buildPower.weaponPower * bAbilityWpRatio
        let weaponDamage = DamageCalculator(dataSource: dataSource).receivedWeaponDamage(weaponStrength)
        let crystalStrength = dataSource.attacker.crystalPower * bAbilityCpRatio
        let crystalDamage = DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(crystalStrength)
        return weaponDamage + crystalDamage
    }
    
    var bAbilityStunDuration: Double {
        let duration = bAbilityStunDurationPerTier[bAbilityTier]! + dataSource.attacker.crystalPower * bAbilityStunCrystalRatio
        return (duration > 1.4) ? 1.4 : duration
    }
    
    var bAbilityPassiveDamageReduction: Double {
        let value = bAbilityPassiveDamageReductionPerTier[bAbilityTier]! + dataSource.attacker.crystalPower * bAbilityPassiveDamageReductionCrystalRatio
        return (value > 0.5) ? 0.5 : value
    }
    
    var bAbilityActiveDamageReduction: Double {
        let value = bAbilityActiveDamageReductionPerTier[bAbilityTier]! + dataSource.attacker.crystalPower * bAbilityActiveDamageReductionCrystalRatio
        return (value > 0.9) ? 0.9 : value
    }
    
    var bAbilityCooldown: Double {
        return bAbilityCooldownPerTier[bAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //ult
    
    var ultDamage: Double {
        let x = ultDamagePerTier[ultTier]! + dataSource.attacker.crystalPower * ultCpRatio
        let crystalDamage = DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
        let weaponDamage = BasicAttackDamage(dataSource: dataSource).damage
        return weaponDamage + crystalDamage
    }
    
    var ultCooldown: Double {
        return ultCdPerTier[ultTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
}
