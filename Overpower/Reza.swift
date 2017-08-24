//
//  Reza.swift
//  OverPowered
//
//  Created by yy on 2017/8/15.
//  Copyright © 2017年 Bright Future. All rights reserved.
//

import Foundation

struct Reza {
    
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

    let aAbilityCdPerTier: [Int : Double] = [1 : 6, 2 : 35.5, 3 : 5, 4 : 4.5, 5 : 4]
    let aAbilityDamagePerTier: [Int : Double] = [1 : 70, 2 : 110, 3 : 150, 4 : 190, 5 : 270]
    let aAbilityCpRatio = 0.7
    let aAbilityDistancePerTier: [Int : Double] = [1 : 7, 2 : 7, 3 : 7, 4 : 7, 5 : 9]

    let bAbilityCdPerTier: [Int : Double] = [1 : 2, 2 : 2, 3 : 2, 4 : 2, 5 : 2]
    let bAbilityDamagePerTier: [Int : Double] = [1 : 70, 2 : 100, 3 : 130, 4 : 160, 5 : 190]
    let bAbilityAddNormalAttackDamagePerTier: [Int : Double] = [1 : 25, 2 : 50, 3 : 75, 4 : 100, 5 : 125]
    let bAbilityDamageCrystalRatio = 0.6
    let bAbilityAddNomalAttackCrystalRatio = 0.8
    let bAbilityChargeTime: [Int : Double] = [1 : 17, 2 : 16, 3 : 15, 4 : 14, 5 : 12]
    
    let ultDamagePerTier: [Int : Double] = [1 : 250, 2 : 350, 3 : 450]
    let ultDamageCrystalRatio = 0.5
    let ultFortifiedHealthePerTier: [Int : Double] = [1 : 75, 2 : 125, 3 : 175]
    let ultFortifiedHealtheRatio = 0.1
    let ultDurationTimePerTier: [Int : Double] = [1 : 4, 2 : 5, 3 : 6]
    let ultCooldownPerTier: [Int : Double] = [1 : 50, 2 : 45, 3 : 40]

    var withBasicAttacks: Double{
        let basicAttackWeaponDamage = BasicAttackDamage(dataSource: dataSource).damage
        let basicAttackCrystalDamage = 20.0 + Double(dataSource.attacker.heroPower.level!) * 15 + dataSource.attacker.crystalPower * 1.2
        let receivedBasicAttackCrystalDamage = DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(basicAttackCrystalDamage)
        let receivedBasicAttackWeaponDamage = DamageCalculator(dataSource: dataSource).receivedWeaponDamage(basicAttackWeaponDamage)
        return receivedBasicAttackWeaponDamage + receivedBasicAttackCrystalDamage
    }
    
    //A ability
    
    var aAbilityCooldown: Double {
        return aAbilityCdPerTier[aAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    var aAbilityDamage: Double {
        let x = aAbilityDamagePerTier[aAbilityTier]! + dataSource.attacker.crystalPower * aAbilityCpRatio
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var aAbilityDamageWithBasicAttacks: Double {
        return withBasicAttacks + aAbilityDamage
    }
    
    
    //B ability
    
    var bAbilityCooldown: Double {
        return bAbilityCdPerTier[bAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    var bAbilityDamage: Double {
        let x = bAbilityDamagePerTier[bAbilityTier]! + dataSource.attacker.crystalPower * bAbilityDamageCrystalRatio
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var bAddDamage: Double{
        let x = bAbilityAddNormalAttackDamagePerTier[bAbilityTier]! + dataSource.attacker.crystalPower * bAbilityAddNomalAttackCrystalRatio
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var bAbilityDamageWithBasicAttacksWithoutFire: Double{
        let basicAttackWeaponDamage = BasicAttackDamage(dataSource: dataSource).damage
        return bAbilityDamage + bAddDamage + basicAttackWeaponDamage
    }
    
    var bAbilityDamageWithBasicAttacks: Double {
        return withBasicAttacks + bAbilityDamage + bAddDamage
    }
    
    //ult
    
    var ultCooldown: Double {
        return ultCooldownPerTier[ultTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    var ultDamage: Double {
        let x = ultDamagePerTier[ultTier]! + dataSource.attacker.crystalPower * ultDamageCrystalRatio
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var ultDamageWithBasicAttacks: Double {
        return withBasicAttacks + ultDamage
    }
    
    var ultDps: Double {
        return (dataSource.attacker.attackSpeed / dataSource.attacker.attackCooldown) * withBasicAttacks
    }
    
    var ultFortifiedHealth: Double {
        return ultFortifiedHealthePerTier[ultTier]! + dataSource.attacker.crystalPower * 0.1
    }
    
    var ultDurationTime: Double{
        return ultDurationTimePerTier[ultTier]!
    }
    
    
    
}
