//
//  Petal.swift
//  OverPowered
//
//  Created by yy on 2017/8/13.
//  Copyright © 2017年 Bright Future. All rights reserved.
//

import Foundation

struct Petal {
    
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
    
    let aAbilityCdPerTier: [Int : Double] = [1 : 2.5, 2 : 2.5, 3 : 2.5, 4 : 2.5, 5 : 2.5]
    let aAbilityPetHealthPerTier: [Int : Double] = [1 : 100, 2 : 180, 3 : 260, 4 : 340, 5 : 500]
    let aAbilityPetDefensePerTier: [Int : Double] = [1 : 30, 2 : 35, 3 : 40, 4 : 45, 5 : 50]
    let aAbilityPetDamagePerTier: [Int : Double] = [1 : 7, 2 : 14, 3 : 21, 4 : 28, 5 : 42]
    let aAbilitySeedDamagePerTier: [Int : Double]  = [1 : 75, 2 : 125, 3 : 175, 4 : 225, 5 : 275]
    
    let bAbilitCdPerTier: [Int : Double] = [1 : 10, 2 : 9.5, 3 : 9, 4 : 8.5, 5 : 7]
    let bAbilitAmplifierPerTier: [Int : Double] = [1 : 0.2, 2 : 0.2, 3 : 0.2, 4 : 0.2, 5 : 0.2]
    
    let ultDamagePerTier: [Int : Double] = [1 : 180, 2 : 240, 3 : 300]
    let ultCpRatio = 0.7
    let ultHealPerTier: [Int : Double] = [1 : 60, 2 : 100, 3 : 140]
    let ultHealCrystalRatio = 0.2
    let ultChargeTimePerTier: [Int : Double] = [1 : 30, 2 : 25, 3 : 20]
    
    //A ability
    
    var aAbilityPetHealth: Double {
        return aAbilityPetHealthPerTier[aAbilityTier]! + dataSource.attacker.crystalPower * 0.3
    }
    
    var aAbilityPetDefense: Double {
        return aAbilityPetDefensePerTier[aAbilityTier]! + dataSource.attacker.crystalPower * 0.005
    }
    
    var aAbilityPetDPS: Double {
        let x = aAbilityPetDefensePerTier[aAbilityTier]! + dataSource.attacker.crystalPower * 0.4
        let damage = DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
        let hitsPerSec = 1.0
        // doesn't scale with attack speed or cooldown, like fortress' wolves
        let dpsPerPet = damage * hitsPerSec
        return dpsPerPet * 3
    }
    
    var aAbilityDpsWithAutoAttack: Double {
        let dps = DPSCalculator(dataSource: dataSource).dps
        return dps + aAbilityPetDPS
    }
    
    var aAbilitySeedExplosionDamage: Double {
        let x = aAbilitySeedDamagePerTier[aAbilityTier]! + dataSource.attacker.crystalPower * 1
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var aAbilityCooldown: Double {
        return aAbilityCdPerTier[aAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //B ability
    
    var bAbilitAmplifier: Double {
        return 1 + bAbilitAmplifierPerTier[bAbilityTier]!
    }
    
    var bAbilitCooldown: Double {
        return bAbilitCdPerTier[bAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //ult
    
    var ultDamage: Double {
        let x = ultDamagePerTier[ultTier]! + dataSource.attacker.crystalPower * ultCpRatio
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var ultTotalDamage: Double {
        return ultDamage * 3
    }
    
    var ultHeal: Double {
        return ultHealPerTier[ultTier]! * ultHealCrystalRatio
    }
    
    var ultTotalHeal: Double {
        return ultHeal * 3
    }
    
    var ultChargeTime: Double {
        return ultChargeTimePerTier[ultTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
}
