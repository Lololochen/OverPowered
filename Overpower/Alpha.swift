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
    
    let ultDamagePerTier: [Int : Double] = [1 : 529, 2 : 933, 3 : 1337]
    let ultCpRatio = 2.5
    
    //aAbility
    
    var aAbilityNoStackRawWeaponDamage: Double {
        let x = aAbilityDamagePerTier[aAbilityTier]! + dataSource.attacker.crystalPower * aAbilityCpRatio
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var aAbilityNoStackRawCrystalDamage: Double {
        return dataSource.attacker.buildPower.weaponPower * aAbilityWpRatio
    }
    
    var aAbilityFullStackRawCrystalDamage: Double {
        let rawCrystalDamagePerStack = dataSource.attacker.buildPower.crystalPower * aAbilityDamagePerStackCrystalRatio
        let x = aAbilityNoStackRawCrystalDamage + rawCrystalDamagePerStack * 3
        return  x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var aAbilityFullStackRawWeaponDamage: Double {
        let rawWeaponDamagePerStack = dataSource.attacker.buildPower.weaponPower * aAbilityDamagePerStackWeaponRatio
        return aAbilityNoStackRawWeaponDamage + rawWeaponDamagePerStack * 3
    }
    
    var aAbilityCooldown: Double {
        return aAbilityCdPerTier[aAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //bAbility
    
    var bAbilityCooldown: Double {
        return bAbilityCdPerTier[bAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    var bAbilityMimimumCooldownInFight: Double {
        return bAbilityCooldown / (bAbilityBasicAttackCDRPerTier[bAbilityTier]! + BasicAttackDamage(dataSource: dataSource).maxHitsPerSec)
    }
    
    //ult
    
    var ultRawDamage: Double {
        let x = ultDamagePerTier[ultTier]! + dataSource.attacker.crystalPower * ultCpRatio
        return  x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
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
