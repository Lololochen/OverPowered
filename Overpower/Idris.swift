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
    let barrierWeaponRatio = 0.75
    
    let bAbilityCooldownPerTier: [Int : Double] = [1 : 8, 2 : 7.5, 3 : 7, 4 : 6.5, 5 : 5]
    let bAbilityDamagePerTier: [Int : Double] = [1 : 60, 2 : 110, 3 : 160, 4 : 210, 5 : 260]
    let bAbilityWpRatio: Double = 0.9
    let bAbilityCpRatio: Double = 1.3
    
    let ultDamagePerTier: [Int : Double] = [1 : 200, 2 : 350, 3 : 500]
    let ultWpRatio: Double = 1
    
    //A ability
    
    var aAbilityBarrier: Double {
        return AbilityBarrierPerTier[aAbilityTier]! + dataSource.attacker.buildPower.weaponPower * barrierWeaponRatio
    }
    
    var aAbilityCooldown: Double {
        return AbilityCooldownPerTier[aAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    var aAbilityCooldownInFight: Double {
        if dataSource.attacker.buildPower.weaponPower > 125 {
            return aAbilityCooldown / (1 + Double(BasicAttackDamage(dataSource: dataSource).maxHitsPerSec))
        }
        return aAbilityCooldown
    }
    
    //B ability
    
    var bAbilityRawCrystalDamage: Double {
        let x = bAbilityDamagePerTier[bAbilityTier]! + dataSource.attacker.crystalPower * bAbilityCpRatio
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var bAbilityRawWeaponDamage: Double {
        return dataSource.attacker.buildPower.weaponPower * bAbilityWpRatio
    }
    
    var bAbilityCooldown: Double {
        return bAbilityCooldownPerTier[bAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //ult
    
    var ultRawWeaponDamage: Double {
        return dataSource.attacker.buildPower.weaponPower * ultWpRatio + ultDamagePerTier[ultTier]!
    }
}
