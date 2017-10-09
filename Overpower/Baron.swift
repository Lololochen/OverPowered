//
//  Baron.swift
//  OverPowered
//
//  Created by yy on 2017/8/10.
//  Copyright © 2017年 Bright Future. All rights reserved.
//

import Foundation

struct Baron {
    
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

    let aAbilityCooldownPerTier: [Int : Double] = [1 : 5, 2 : 4.5, 3 : 4, 4 : 3.5, 5 : 2.5]
    let aAbilityDamagePerTier: [Int : Double] = [1 : 40, 2 : 120, 3 : 200, 4 : 280, 5 : 360]
    
    let bAbilityCooldownPerTier: [Int : Double] = [1 : 22, 2 : 20, 3 : 18, 4 : 16, 5 : 12]
    let bAbilitySpeedBoostPerTier: [Int : Double] = [1 : 0.8, 2 : 1, 3 : 1.2, 4 : 1.4, 5 : 1.8]
    
    let ultDamagePerTier: [Int : Double] = [1 : 400, 2 : 650, 3 : 900]
    let ultRangePerTier: [Int : Double] = [1 : 20, 2 : 35, 3 : 50]
    let ultBasicAttackRangePerTier: [Int : Double] = [1 : 6.4, 2 : 6.9, 3 : 7.4]
    
    //A ability
    
    var aAbilityRawCrystalDamage: Double {
        let x = aAbilityDamagePerTier[aAbilityTier]! + dataSource.attacker.crystalPower * 1.9
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var aAbilityRawWeaponDamage: Double {
        return dataSource.attacker.buildPower.weaponPower * 0.7
    }
    
    var aAbilityRange: Double {
        let optimalRange = 8 + dataSource.attacker.crystalPower * 0.015
        if optimalRange > 11 {
            return 11
        } else {
            return optimalRange
        }
    }
    
    var aAbilitySlowFactor: Double {
        let optimalSlow = 0.35 + 0.3 / 200 * dataSource.attacker.weaponPower
        if optimalSlow > 0.65 {
            return 0.65 * 1.1
        } else {
            return optimalSlow * 1.1
        }
    }
    
    var aAbilityChargeTime: Double {
        return aAbilityCooldownPerTier[aAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //B ability
    
    var bAbilityRange: Double {
        let optimalRange = 10 + dataSource.attacker.crystalPower * 0.04
        if optimalRange > 18 {
            return 18
        } else {
            return optimalRange
        }
    }
    
    var bAbilitySpeedBoost: Double {
        return bAbilitySpeedBoostPerTier[bAbilityTier]! + dataSource.attacker.weaponPower * 0.001
    }
    
    var bAbilityCooldown: Double {
        return bAbilityCooldownPerTier[bAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    var bAbilityCooldownInFight: Double {
        let cdrPercentagePerHit = 0.125
        let landingCooldown = bAbilityCooldown * 0.875
        return landingCooldown / (1 + cdrPercentagePerHit * bAbilityCooldown * (BasicAttackDamage(dataSource: dataSource).maxHitsPerSec))
    }

    // ult
    
    var ultRawCrystalDamage: Double {
        let x = ultDamagePerTier[ultTier]! + dataSource.attacker.crystalPower * 2.25
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var ultRawWeaponDamage: Double {
        return dataSource.attacker.buildPower.weaponPower * 1.2
    }
    
}
