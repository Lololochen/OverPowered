//
//  Grace.swift
//  OverPowered
//
//  Created by Bright Future on 26/06/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

struct Grace {
    
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
    
    let aAbilityCDPerTier: [Int : Double] = [1 : 15, 2 : 14, 3 : 13, 4 : 12, 5 : 10]
    let aAbilityRangePerTier: [Int : Double] = [1 : 7, 2 : 7, 3 : 7, 4 : 7, 5 : 9]
    let aAbilityShieldDurationOnSelf: Double = 3
    let aAbilityShieldBaseDurationOnAlly: Double = 1.8
    let aAbilityBonusDamagePerTier: [Int : Double] = [1 : 20, 2 : 40, 3 : 60, 4 : 80, 5 : 120]
    let aAbilityBonusDamageWPRatio: Double = 0.4
    let aAbilityBonusDamageCPRatio: Double = 1
    let bAbilityCDPerTier: [Int : Double] = [1 : 13, 2 : 12, 3 : 11, 4 : 10, 5 : 8]
    let bAbilityDamagePerTier: [Int : Double] = [1 : 125, 2 : 200, 3 : 275, 4 : 350, 5 : 425]
    let bAbilityDamageCPRatio: Double = 2
    let ultCDPerTier: [Int : Double] = [1 : 60, 2 : 45, 3 : 30]
    let ultHeaLPetTier: [Int : Double] = [1 : 400, 2 : 600, 3 : 800]
    let ultHealCPRatio: Double = 1.5
    let empoweredBasicAttackSlowStrength: Double = 0.75
    
    var empoweredBasicAttackSlowDuration: Double {
        let crystalRatio = 0.003
        if dataSource.attacker.crystalPower < 200 {
            return 0.6 + crystalRatio * dataSource.attacker.crystalPower
        } else {
            return 0.6 + crystalRatio * 200
        }
    }
    
    var empoweredBasicAttackSlowDistance: Double {
        return dataSource.defender.moveSpeed * empoweredBasicAttackSlowStrength * empoweredBasicAttackSlowDuration
    }
    
    var aAbilityShieldDurationOnAlly: Double {
        if dataSource.attacker.crystalPower < 200 {
            return aAbilityShieldBaseDurationOnAlly + 0.006 * dataSource.attacker.crystalPower
        } else {
            return aAbilityShieldBaseDurationOnAlly + 0.006 * 200
        }
    }
    
    var aAbilityBonusDamage: Double {
        let weaponStrength = aAbilityBonusDamagePerTier[aAbilityTier]! + dataSource.attacker.buildPower.weaponPower * aAbilityBonusDamageWPRatio
        let weaponDamage = DamageCalculator(dataSource: dataSource).receivedWeaponDamage(weaponStrength)
        let crystalStrength = dataSource.attacker.crystalPower * aAbilityBonusDamageCPRatio
        let crystalDamage = DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(crystalStrength)
        return weaponDamage + crystalDamage
    }
    
    var aAbilityCooldown: Double {
        return aAbilityCDPerTier[aAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    var bAbilityDamage: Double {
        let x = bAbilityDamagePerTier[bAbilityTier]! + dataSource.attacker.crystalPower * bAbilityDamageCPRatio
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var bAbilityCooldown: Double {
        return bAbilityCDPerTier[bAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    var ultHeal: Double {
        return ultHeaLPetTier[ultTier]! + ultHealCPRatio * dataSource.attacker.crystalPower
    }
    
    var ultCooldown: Double {
        return ultCDPerTier[ultTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
}
