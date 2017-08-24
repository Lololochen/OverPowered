//
//  Blackfeather.swift
//  OverPowered
//
//  Created by yy on 2017/8/10.
//  Copyright © 2017年 Bright Future. All rights reserved.
//

import Foundation

struct Blackfeather {
    
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
    
    let aAbilityCooldownPerTier: [Int : Double] = [1 : 8, 2 : 7.5, 3 : 7, 4 : 6.5, 5 : 6]
    let aAbilitymissingHealthDamagePerTier: [Int : Double] = [1 : 0.15, 2 : 0.16, 3 : 0.17, 4 : 0.18, 5 : 0.2]
    let aAbilityHeartthrobStacksAppliedPerTier: [Int : Int] = [1 : 1, 2 : 2, 3 : 3, 4 : 4, 5 : 5]
    
    let bAbilityDamagePerTier: [Int : Double] = [1 : 80, 2 : 120, 3 : 160, 4 : 200, 5 : 240]
    let bAbilitySlowPerTier: [Int : Double] = [1 : 0.5, 2 : 0.55, 3 : 0.6, 4 : 0.65, 5 : 0.7]
    let bAbilityBarrierPerTier: [Int : Double] = [1 : 125, 2 : 150, 3 : 175, 4 : 200, 5 : 250]
    let bAbilityCooldownPerTier: [Int : Double] = [1 : 6, 2 : 5.5, 3 : 5, 4 : 4.5, 5 : 3.5]
    
    let ultDamagePerTier: [Int : Double] = [1 : 50, 2 : 100, 3 : 150]
    let ultChargeTimePerTier: [Int : Double] = [1 : 40, 2 : 30, 3 : 20]
    let ultFortifiedHealthePerTier: [Int : Double] = [1 : 60, 2 : 100, 3 : 140]
    
    //A ability
    
    var aAbilityCrystalDamage: Double {
        let x = dataSource.attacker.crystalPower * 0.5
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var aAbilityBasicAttackDamage: Double {
        return BasicAttackDamage(dataSource: dataSource).damage
    }
    
    var aAbilityDamageWithoutHeartthrobStack: Double {
        return aAbilityCrystalDamage + aAbilityBasicAttackDamage
    }
    
    func aAbilityCalcDamageWithHealthPercentage(percentage: Double) -> Double {
        let x = dataSource.attacker.weaponPower * 0.2 + aAbilitymissingHealthDamagePerTier[aAbilityTier]! * (1 - percentage) * dataSource.defender.health
        let weaponDamage = DamageCalculator(dataSource: dataSource).receivedWeaponDamage(x)
        
        return aAbilityCrystalDamage + weaponDamage + aAbilityBasicAttackDamage
    }
    
    var aAbilityExecutableHealthPercentage: Double {
        
        let b = (1 - dataSource.attacker.armorPierce) / (1 + dataSource.defender.armor / 100) + dataSource.attacker.armorPierce
        let c = aAbilitymissingHealthDamagePerTier[aAbilityTier]! * dataSource.defender.health
        let wp = dataSource.attacker.weaponPower
        let health = dataSource.defender.health
        
        return (wp * 0.2 * b + aAbilityCrystalDamage + aAbilityBasicAttackDamage + c * b) / (health + c * b)
    }
    
    var aAbilityHeartthrobApplied: Int {
        return aAbilityHeartthrobStacksAppliedPerTier[aAbilityTier]!
    }
    
    var aAbilityRoseTrailSpeedBoost: Double {
        return 1 + dataSource.attacker.crystalPower * 0.006
    }
    
    var aAbilityCooldown: Double {
        return aAbilityCooldownPerTier[aAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //B ability
    
    var bAbilityDamage: Double {
        let crystalStrength = bAbilityDamagePerTier[bAbilityTier]! + dataSource.attacker.crystalPower * 1.8
        let crystalDamage = DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(crystalStrength)
        let weaponStrength = dataSource.attacker.buildPower.weaponPower
        let weaponDamage = DamageCalculator(dataSource: dataSource).receivedWeaponDamage(weaponStrength)
        return crystalDamage + weaponDamage
    }
    
    var bAbilitySlow: Double {
        return bAbilitySlowPerTier[bAbilityTier]!
    }
    
    var bAbilitySlowDuration: Double {
        return 1 + Double(dataSource.attacker.heroPower.heartthrobStack) * 0.3
    }
    
    var bAbilityBarrier: Double {
        return bAbilityBarrierPerTier[bAbilityTier]! + dataSource.attacker.buildPower.health * 0.1
    }
    
    var bAbilityCooldown: Double {
        return bAbilityCooldownPerTier[bAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    var bAbilityFocusCostWhenHittingEnemy: Double {
        return 25 + dataSource.attacker.buildPower.maxEnergy * 0.02 + dataSource.attacker.buildPower.energyRecharge * 0.5
    }
    
    //ult
    
    var ultDamage: Double {
        let basicAttackDamage = BasicAttackDamage(dataSource: dataSource).damage
        let crystalStrength = dataSource.attacker.crystalPower * 0.5
        let crystalDamage = DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(crystalStrength)
        return crystalDamage + basicAttackDamage
    }
    
    var ultChargeTime: Double {
        return ultChargeTimePerTier[ultTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    var ultFortifiedHealth: Double {
        return ultFortifiedHealthePerTier[ultTier]!
    }
}
