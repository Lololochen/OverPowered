//
//  Alpha.swift
//  OverPowered
//
//  Created by yy on 2017/8/10.
//  Copyright © 2017年 Bright Future. All rights reserved.
//

import Foundation

struct Alpha {
    
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
    
    let aAbilityCdPerTier: [Int : Double] = [1 : 12, 2 : 11, 3 : 10, 4 : 9, 5 : 8]
    let aAbilityDamagePerTier: [Int : Double] = [1 : 80, 2 : 100, 3 : 120, 4 : 100, 5 : 120]
    let aAbilityCpRatio = 2.0
    let aAbilityWpRatio = 0.8
    let aAbilityDamagePerStackPerTier: [Int : Double] = [1 : 40, 2 : 60, 3 : 80, 4 : 100, 5 : 120]
    let aAbilityDamagePerStackCrystalRatio = 0.4
    let aAbilityDamagePerStackWeaponRatio = 0.4
    let aAbilitySlowPerTier: [Int : Double] = [1 : 0.4, 2 : 0.5, 3 : 0.6, 4 : 0.7, 5 : 0.8]
    
    let bAbilityCdPerTier: [Int : Double] = [1 : 6, 2 : 5.5, 3 : 5, 4 : 4.5, 5 : 4]
    let bAbilityDamagePerTier: [Int : Double] = [1 : 20, 2 : 35, 3 : 50, 4 : 65, 5 : 80]
    let bAbilityCpRatio = 1.0
    let bAbilityWpRatio = 1.0
    let bAbilityBasicAttackCDRPerTier: [Int : Double] = [1 : 1, 2 : 1, 3 : 1, 4 : 1, 5 : 1.2]
    let bAbilityBonusDamagePerStackPerTier: [Int : Double] = [1 : 0.1, 2 : 0.1, 3 : 0.1, 4 : 0.1, 5 : 0.15]
    
    let ultDamagePerTier: [Int : Double] = [1 : 529, 2 : 933, 3 : 1337]
    let ultCpRatio = 2.5
    
    //aAbility
    
    var aAbilityNoStackDamage: Double {
        let weaponStrength = dataSource.attacker.buildPower.weaponPower * aAbilityWpRatio
        let weaponDamage = DamageCalculator(dataSource: dataSource).receivedWeaponDamage(weaponStrength)
        let crystalStrength = aAbilityDamagePerTier[aAbilityTier]! + dataSource.attacker.crystalPower * aAbilityCpRatio
        let crystalDamage = DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(crystalStrength)
        return weaponDamage + crystalDamage
    }
    
    var aAbilityCoreOverloadBunusDamage: Double {
        let weaponStrength = dataSource.attacker.buildPower.weaponPower * aAbilityDamagePerStackWeaponRatio
        let weaponDamage = DamageCalculator(dataSource: dataSource).receivedWeaponDamage(weaponStrength)
        let crystalStrength = aAbilityDamagePerStackPerTier[aAbilityTier]! + dataSource.attacker.crystalPower * aAbilityDamagePerStackCrystalRatio
        let crystalDamage = DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(crystalStrength)
        return weaponDamage + crystalDamage
    }
    
    var aAbilityFullStackDamage: Double {
        return aAbilityCoreOverloadBunusDamage * 3 + aAbilityNoStackDamage
    }
    
    var aAbilityCooldown: Double {
        return aAbilityCdPerTier[aAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //bAbility
    
    var bAbilityDamage: Double {
        let basicAttackDamage = BasicAttackDamage(dataSource: dataSource).damage
        let weaponStrength = dataSource.attacker.buildPower.weaponPower * bAbilityWpRatio
        let weaponDamage = DamageCalculator(dataSource: dataSource).receivedWeaponDamage(weaponStrength)
        let crystalStrength = bAbilityDamagePerTier[bAbilityTier]! + dataSource.attacker.crystalPower * bAbilityCpRatio
        let crystalDamage = DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(crystalStrength)
        return weaponDamage + crystalDamage + basicAttackDamage
    }
    
    var bAbilityHealPerStack: Double {
        return 10 + dataSource.attacker.weaponPower * 0.02
    }
    
    var bAbilityMaxHealPerSec: Double {
        return bAbilityHealPerStack * 3 * (DPSCalculator(dataSource: dataSource).maxHitsPerSec + 1 / bAbilityCooldown)
    }
    
    var bAbilityFullStackDamage: Double {
        return bAbilityDamage * (bAbilityBonusDamagePerStackPerTier[bAbilityTier]! * 3 + 1)
    }
    
    var bAbilityCooldown: Double {
        return bAbilityCdPerTier[bAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    var bAbilityMimimumCooldownInFight: Double {
        return bAbilityCooldown / (bAbilityBasicAttackCDRPerTier[bAbilityTier]! + DPSCalculator(dataSource: dataSource).maxHitsPerSec)
    }
    
    //ult
    
    var ultDamage: Double {
        let x = ultDamagePerTier[ultTier]! + dataSource.attacker.crystalPower * ultCpRatio
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var ultRebootHealth: Double {
        let baseHealth = (1800 - 325) / 11 * Double(dataSource.attacker.heroPower.level!) + 325
        return baseHealth + dataSource.attacker.buildPower.maxEnergy * 0.5
    }
    
    var ultRebootDuration: Double {
        return 4.5 - dataSource.attacker.buildPower.energyRecharge * 0.15
    }
    
    var ultLethalDPS: Double {
        return ultRebootHealth / ultRebootDuration
    }
}
