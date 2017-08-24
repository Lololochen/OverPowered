//
//  Joule.swift
//  OverPowered
//
//  Created by yy on 2017/8/12.
//  Copyright © 2017年 Bright Future. All rights reserved.
//

import Foundation

struct Joule {
    
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
    
    let aAbilityCooldownPerTier: [Int : Double] = [1 : 22, 2 : 20, 3 : 18, 4 : 16, 5 : 10]
    let aAbilityDamagePerTier: [Int : Double] = [1 : 150, 2 : 200, 3 : 250, 4 : 300, 5 : 350]
    let aAbilityStunDurationPerTier: [Int : Double] = [1 : 1.1, 2 : 1.2, 3 : 1.3, 4 : 1.4, 5 : 1.5]
    let aAbilityCpRatio: Double = 1.7
    
    let bAbilityCooldown = 2.5
    let bAbilityDamagePerTier: [Int : Double] = [1 : 80, 2 : 110, 3 : 140, 4 : 170, 5 : 200]
    let bAbilityBonusPiercePerTier: [Int : Double] = [1 : 0.05, 2 : 0.06, 3 : 0.07, 4 : 0.08, 5 : 0.1]
    let bAbilityWpRatio = 1.75
    let bAbilityCpRatio = 1.35
    
    let ultDamagePerTier: [Int : Double] = [1 : 800, 2 : 1500, 3 : 2200]
    let ultCpRatio = 4.6
    
    //A ability
    
    var aAbilityDamage: Double {
        let x = aAbilityDamagePerTier[aAbilityTier]! + dataSource.attacker.crystalPower * aAbilityCpRatio
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var aAbilityCooldown: Double {
        return aAbilityCooldownPerTier[aAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //B ability
    
    var bAbilityDamageWithoutPierce: Double {
        let weaponStrength = dataSource.attacker.buildPower.weaponPower * bAbilityWpRatio
        let weaponDamage = DamageCalculator(dataSource: dataSource).receivedWeaponDamage(weaponStrength)
        let crystalStrength = bAbilityDamagePerTier[bAbilityTier]! + dataSource.attacker.crystalPower * bAbilityCpRatio
        let crystalDamage = DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(crystalStrength)
        return weaponDamage + crystalDamage
    }
    
    var bAbilityDamageWithPierce: Double {
        let weaponDamage = dataSource.attacker.buildPower.weaponPower * bAbilityWpRatio
        var armorPierce = dataSource.attacker.armorPierce + bAbilityBonusPiercePerTier[bAbilityTier]!
        if armorPierce > 1 { armorPierce = 1 }
        let piercedWeaponDamage = weaponDamage / (1 + dataSource.defender.armor / 100) * (1 - armorPierce) + weaponDamage * armorPierce
        
        let crystalStrength = bAbilityDamagePerTier[bAbilityTier]! + dataSource.attacker.crystalPower * bAbilityCpRatio
        let crystalDamage = crystalStrength * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
        var shieldPierce = dataSource.attacker.shieldPierce + bAbilityBonusPiercePerTier[bAbilityTier]!
        if shieldPierce > 1 { shieldPierce = 1 }
        let piercedCrystalDamage = crystalDamage / (1 + dataSource.defender.shield / 100) * (1 - shieldPierce) + crystalDamage * shieldPierce
        
        return piercedWeaponDamage + piercedCrystalDamage
    }
    
    var bAbilityDpsWithBasicAttacks: Double {
        let hitsPerSec = dataSource.attacker.attackSpeed / bAbilityCooldown
        let abilityDPS = bAbilityDamageWithPierce * hitsPerSec
        let basicAttackDPS = DPSCalculator(dataSource: dataSource).dps
        return abilityDPS + basicAttackDPS
    }
    
    //ult
    
    var ultDamage: Double {
        let x = ultDamagePerTier[ultTier]! + dataSource.attacker.crystalPower * ultCpRatio
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var ultDps: Double {
        return ultDamage / 1.5
    }
}
