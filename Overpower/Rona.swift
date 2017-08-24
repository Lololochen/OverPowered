//
//  Rona.swift
//  OverPowered
//
//  Created by yy on 2017/8/15.
//  Copyright © 2017年 Bright Future. All rights reserved.
//

import Foundation

struct Rona {
    
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
    
    let aAbilityCdPerTier: [Int : Double] = [1 : 13, 2 : 12, 3 : 11, 4 : 10, 5 : 9]
    let aAbilityImpactDamagePerTier: [Int : Double] = [1 : 50, 2 : 70, 3 : 90, 4 : 110, 5 : 150]
    let aAbilityBloodRageGainPerTier: [Int : Double] = [1 : 25, 2 : 25, 3 : 25, 4 : 25, 5 : 25]
    let aAbilityFortifiedHealthPerTier: [Int : Double] = [1 : 30, 2 : 40, 3 : 50, 4 : 60, 5 : 80]
    let aAbilityRuptureDamagePerTier: [Int : Double] = [1 : 100, 2 : 140, 3 : 180, 4 : 220, 5 : 300]
    
    let bAbilityCdPerTier: [Int : Double] = [1 : 16, 2 : 15, 3 : 14, 4 : 13, 5 : 12]
    let bAbilityFirstAttackDamagePerTier: [Int : Double] = [1 : 10, 2 : 20, 3 : 30, 4 : 40, 5 : 70]
    let bAbilityBloodRageGainPerTier: [Int : Double] = [1 : 5, 2 : 10, 3 : 15, 4 : 20, 5 : 25]
    let bAbilitySecondAttackDamagePerTier: [Int : Double] = [1 : 10, 2 : 20, 3 : 30, 4 : 40, 5 : 70]
    let bAbilityAttackSpeedGainPerTier: [Int : Double] = [1 : 0.15, 2 : 0.2, 3 : 0.25, 4 : 0.3, 5 : 0.4]
    let bAbilityEmpoweredDurationPerTier: [Int : Double] = [1 : 2, 2 : 2.5, 3 : 3, 4 : 3.5, 5 : 4]
    
    let ultCdPerTier: [Int : Double] = [1 : 4, 2 : 4, 3 : 4]
    let ultDpsPerTier: [Int : Double] = [1 : 225, 2 : 350, 3 : 475]
    let ultCpRatio = 1.0
    let ultWpRatio = 1.75
    let ultFortifyPerSecPerTier: [Int : Double] = [1 : 40, 2 : 70, 3 : 100]
    
    //A ability
    
    var aAbilityBloodRageGainOnSingleTarget: Double {
        return aAbilityBloodRageGainPerTier[aAbilityTier]!
    }
    
    var aAbilityBloodRageGainOnTripleTargets: Double {
        let gain = aAbilityBloodRageGainOnSingleTarget * 3
        return (gain > 100) ? 100 : gain
    }
    
    var aAbilityImpactDamage: Double {
        let x = aAbilityImpactDamagePerTier[aAbilityTier]! + dataSource.attacker.crystalPower * 1
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var aAbilityRuptureDamage: Double {
        let x = aAbilityRuptureDamagePerTier[aAbilityTier]! + dataSource.attacker.crystalPower * 2
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var aAbilityFortifiedHealthFromSingleTarget: Double {
        return aAbilityFortifiedHealthPerTier[aAbilityTier]!
    }
    
    var aAbilityFortifiedHealthFromTripleTargets: Double {
        return aAbilityFortifiedHealthFromSingleTarget * 3
    }
    
    var aAbilityCooldown: Double {
        return aAbilityCdPerTier[aAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //B ability
    
    var bAbilityFirstAttackDamage: Double {
        
        let weaponStrength = dataSource.attacker.buildPower.weaponPower * 0.85
        let weaponDamage = DamageCalculator(dataSource: dataSource).receivedWeaponDamage(weaponStrength)
        
        let crystalStrength = bAbilityFirstAttackDamagePerTier[bAbilityTier]! + dataSource.attacker.crystalPower * 1.0
        let crystalDamage = DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(crystalStrength)
        
        return weaponDamage + crystalDamage
    }
    
    var bAbilityBloodRageGain: Double {
        return bAbilityBloodRageGainPerTier[bAbilityTier]!
    }
    
    var bAbilitySecondAttackDamage: Double {
        
        let weaponStrength = dataSource.attacker.buildPower.weaponPower * 0.85
        let weaponDamage = DamageCalculator(dataSource: dataSource).receivedWeaponDamage(weaponStrength)
        
        let crystalStrength = bAbilitySecondAttackDamagePerTier[bAbilityTier]! + dataSource.attacker.crystalPower * 1.0
        let crystalDamage = DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(crystalStrength)
        
        return weaponDamage + crystalDamage
    }
    
    var bAbilityCooldown: Double {
        return bAbilityCdPerTier[bAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    var bAbilityCooldownInFight: Double {
        let maxHitsPerSec = (dataSource.attacker.attackSpeed + bAbilityAttackSpeedGainPerTier[bAbilityTier]!) / (dataSource.attacker.attackCooldown + 0.2)
        return bAbilityCooldown / (1 + maxHitsPerSec)
    }
    
    //ult
    
    var ultDps: Double {
        let weaponStrength = ultDpsPerTier[ultTier]! + dataSource.attacker.buildPower.weaponPower * ultWpRatio
        let weaponDamage = DamageCalculator(dataSource: dataSource).receivedWeaponDamage(weaponStrength)
        
        let crystalStrength = dataSource.attacker.crystalPower * ultCpRatio
        let crystalDamage = DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(crystalStrength)
        
        return weaponDamage + crystalDamage
    }
    
    var ultFortifiedHealPerSec: Double {
        return ultFortifyPerSecPerTier[ultTier]!
    }
    
    var ultCooldown: Double {
        return ultCdPerTier[ultTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
}
