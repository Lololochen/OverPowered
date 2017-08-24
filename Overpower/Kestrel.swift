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
    
    var aAbilityBasicAttackDamage: Double {
        let basicAttackDamageCalculator = BasicAttackDamage(dataSource: dataSource)
        return basicAttackDamageCalculator.damage
    }
    var aAbilityWeaponDamage: Double {
        let basicAttackWeaponDamage = BasicAttackDamage(dataSource: dataSource).weaponDamagePerHit
        return basicAttackWeaponDamage * aAbilityBasicAttackMultiplifier[aAbilityTier]!
    }
    
    var aAbilityDamageWithTensionBow: Double {
        dataSource.attacker.buildPower.tensionBowBuffed = true
        let baseDamage = BasicAttackDamage(dataSource: dataSource).weaponDamagePerHit
        dataSource.attacker.buildPower.tensionBowBuffed = false
        return baseDamage * aAbilityBasicAttackMultiplifier[aAbilityTier]!
    }
    
    var aAbilitySplashDamage: Double {
        let x = aAbilityDamageLet[aAbilityTier]! + dataSource.attacker.crystalPower * 1.6
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var aAbilityDamage: Double {
        return aAbilityWeaponDamage + aAbilitySplashDamage
    }
    
    var aAbilityReloadTime: Double {
        return 2.7 / (1 + dataSource.attacker.buildPower.attackSpeed / 2)
    }
    
    //B ability
    
    var bAbilityDamage: Double {
        let x = bAbilityDamagePerTier[bAbilityTier]! + dataSource.attacker.crystalPower * 2.7
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
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
    
    var ultWeaponDamage: Double {
        let weaponPower = ultDamagePerTier[ultTier]! + dataSource.attacker.buildPower.weaponPower * 1.2
        var armorPierce = dataSource.attacker.armorPierce + ultArmorPiercePerTier[ultTier]!
        if armorPierce > 1 { armorPierce = 1 }
        let trueDamage = weaponPower / (1 + dataSource.defender.armor / 100) * (1 - armorPierce) + weaponPower * armorPierce
        return DamageCalculator(dataSource: dataSource).receivedDamage(trueDamage)
    }
    
    var ultCrystalDamage: Double {
        let x = dataSource.attacker.buildPower.crystalPower * 2.6
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var ultDamage: Double {
        return ultWeaponDamage + ultCrystalDamage
    }
    
    var ultCooldown: Double {
        return ultCooldownPerTier[ultTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
}
