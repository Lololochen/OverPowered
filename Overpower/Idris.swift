//
//  Idris.swift
//  OverPowered
//
//  Created by yy on 2017/8/12.
//  Copyright © 2017年 Bright Future. All rights reserved.
//

import Foundation

struct Idris {
    
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
    
    let AbilityCooldownPerTier: [Int : Double] = [1 : 15, 2 : 14, 3 : 13, 4 : 12, 5 : 10]
    let AbilityDamageAmplifierPerTier: [Int : Double] = [1 : 0.1, 2 : 0.15, 3 : 0.2, 4 : 0.25, 5 : 0.35]
    let AbilityBarrierPerTier: [Int : Double] = [1 : 125, 2 : 175, 3 : 225, 4 : 275, 5 : 325]
    
    let bAbilityCooldownPerTier: [Int : Double] = [1 : 8, 2 : 7.5, 3 : 7, 4 : 6.5, 5 : 5]
    let bAbilityDamagePerTier: [Int : Double] = [1 : 75, 2 : 125, 3 : 175, 4 : 225, 5 : 275]
    let bAbilityWpRatio: Double = 1
    let bAbilityCpRatio: Double = 1.3
    
    let ultDamagePerTier: [Int : Double] = [1 : 200, 2 : 350, 3 : 500]
    let ultWpRatio: Double = 1
    
    //A ability
    
    var AbilityAmplifiedDamage: Double {
        let basicAttackDamage = BasicAttackDamage(dataSource: dataSource).damage
        return (1 + AbilityDamageAmplifierPerTier[aAbilityTier]!) * basicAttackDamage
    }
    
    var AbilityBarrier: Double {
        return AbilityBarrierPerTier[aAbilityTier]!
    }
    
    var AbilityCooldown: Double {
        return AbilityCooldownPerTier[aAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    var AbilityCooldownInFight: Double {
        if dataSource.attacker.buildPower.weaponPower > 125 {
            return AbilityCooldown / (1 + Double(DPSCalculator(dataSource: dataSource).maxHitsPerSec))
        }
        return AbilityCooldown
    }
    
    //B ability
    
    var bAbilityDamage: Double {
        let weaponStrength = dataSource.attacker.buildPower.weaponPower * bAbilityWpRatio
        let weaponDamage = DamageCalculator(dataSource: dataSource).receivedWeaponDamage(weaponStrength)
        let crystalStrength = bAbilityDamagePerTier[bAbilityTier]! + dataSource.attacker.crystalPower * bAbilityCpRatio
        let crystalDamage = DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(crystalStrength)
        return weaponDamage + crystalDamage
    }
    
    var bAbilityCooldown: Double {
        return bAbilityCooldownPerTier[bAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //ult
    
    var ultDamage: Double {
        let x = dataSource.attacker.buildPower.weaponPower * ultWpRatio + ultDamagePerTier[ultTier]!
        return DamageCalculator(dataSource: dataSource).receivedWeaponDamage(x)
    }
}
