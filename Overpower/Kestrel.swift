//
//  Kestrel.swift
//  OverPowered
//
//  Created by yy on 2017/8/12.
//  Copyright © 2017年 Bright Future. All rights reserved.
//

import Foundation

struct Kestrel {
    
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
    
    let aAbilityBasicAttackMultiplifier: [Int : Double] = [1 : 1, 2 : 1.05, 3 : 1.1, 4 : 1.15, 5 : 1.3]
    let aAbilityDamageLet: [Int : Double] = [1 : 30, 2 : 60, 3 : 90, 4 : 120, 5 : 150]
    
    let bAbilityDamagePerTier: [Int : Double] = [1 : 100, 2 : 150, 3 : 200, 4 : 250, 5 : 300]
    let bAbilityMistDurationPerTier: [Int : Double] = [1 : 4, 2 : 5, 3 : 6, 4 : 7, 5 : 8]
    let bAbilityStealthDurationPerTier: [Int : Double] = [1 : 1.5, 2 : 1.5, 3 : 1.5, 4 : 1.5, 5 : 2]
    let bAbilityCooldownPerTier: [Int : Double] = [1 : 8, 2 : 8, 3 : 8, 4 : 8, 5 : 6]
    
    let ultDamagePerTier: [Int : Double] = [1 : 450, 2 : 625, 3 : 800]
    let ultArmorPiercePerTier: [Int : Double] = [1 : 0.1, 2 : 0.2, 3 : 0.3]
    let ultCooldownPerTier: [Int : Double] = [1 : 55, 2 : 45, 3 : 35]
    
    //A ability
    
    var fourShotsRawWeaponDamage: Double {
        let basicAttackWeaponDamage = BasicAttackDamage(dataSource: dataSource).rawWeaponDamagePerHit * 4
        return basicAttackWeaponDamage * aAbilityBasicAttackMultiplifier[aAbilityTier]!
    }
    
    var fourShotsRawCrystalDamage: Double {
        let x = aAbilityDamageLet[aAbilityTier]! + dataSource.attacker.crystalPower * 1.6 * 4
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var glimmerShotWithBasicAttacksRawWeaponDPS: Double {
        return (fourShotsRawWeaponDamage + BasicAttackDamage(dataSource: dataSource).rawWeaponDamagePerHit * 4) / 3.6
    }
    
    var glimmerShotWithBasicAttacksRawCrystalDPS: Double {
        return (fourShotsRawCrystalDamage + BasicAttackDamage(dataSource: dataSource).rawCrystalDamagePerHit * 4) / 3.6
    }
    
    var aAbilityReloadTime: Double {
        return 2.7 / (1 + dataSource.attacker.buildPower.attackSpeed / 2)
    }
    
    //B ability
    
    var bAbilityRawDamage: Double {
        let x = bAbilityDamagePerTier[bAbilityTier]! + dataSource.attacker.crystalPower * 2.7
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var bAbilityStealthDuration: Double {
        return bAbilityStealthDurationPerTier[bAbilityTier]! + dataSource.attacker.crystalPower * 0.03
    }
    
    var bAbilityMoveSpeedIncrease: Double {
        return 1 + dataSource.attacker.buildPower.weaponPower * 0.002
    }
    
    var bAbilityMistDuration: Double {
        return bAbilityMistDurationPerTier[bAbilityTier]! + dataSource.attacker.crystalPower * 0.01
    }
    
    var bAbilityCooldown: Double {
        return bAbilityCooldownPerTier[bAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //ult
    
    var ultRawWeaponDamage: Double {
        return ultDamagePerTier[ultTier]! + dataSource.attacker.buildPower.weaponPower * 1.2
    }
    
    var ultRawCrystalDamage: Double {
        let x = dataSource.attacker.buildPower.crystalPower * 2.6
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var ultCooldown: Double {
        return ultCooldownPerTier[ultTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
}
