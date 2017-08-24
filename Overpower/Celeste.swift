//
//  Celeste.swift
//  OverPowered
//
//  Created by yy on 2017/8/11.
//  Copyright © 2017年 Bright Future. All rights reserved.
//

import Foundation

struct Celeste {
    
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
    
    let aAbilityCooldownPerTier: [Int : Double] = [1 : 2.8, 2 : 2.4, 3 : 2, 4 : 1.6, 5 : 1.2]
    let aAbilityShootDamagePerTier: [Int : Double] = [1: 100, 2 : 150, 3 : 200, 4 : 250, 5 : 300]
    let aAbilitySuperNovaDamagePerTier: [Int : Double] = [1 : 150, 2 : 200, 3 : 250, 4 : 300, 5 : 350]
    let aAbilityRangePerTier: [Int : Double] = [1 : 7, 2 : 7, 3 : 7, 4 : 7, 5 : 9]
    
    let bAbilityCooldownPerTier: [Int : Double] = [1 : 14, 2 : 13, 3 : 12, 4 : 11, 5 : 9]
    let bAbilityDamagePerTier: [Int : Double] = [1 : 100, 2 : 175, 3 : 250, 4 : 325, 5 : 475]
    let bAbilityStunDurationPerTier: [Int : Double] = [1 : 1, 2 : 1, 3 : 1, 4 : 1, 5 : 1.5]
    
    let ultLeadStarDamagePerTier: [Int : Double] = [1 : 300, 2 : 325, 3 : 350]
    let ultStarDamagePerTier: [Int : Double] = [1 : 150, 2 : 160, 3 : 170]
    let ultNumberOfStarsPerTier: [Int : Double] = [1 : 3, 2 : 5, 3 : 7]
    
    //A ability
    
    var aAbilitySmallStarDamage: Double {
        let x = aAbilityShootDamagePerTier[aAbilityTier]! + dataSource.attacker.crystalPower * 0.9
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    var aAbilityNovaDamage: Double {
        let x = aAbilitySuperNovaDamagePerTier[aAbilityTier]! + dataSource.attacker.crystalPower * 2.2
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var aAbilityRange: Double {
        return aAbilityRangePerTier[aAbilityTier]!
    }
    
    var aAbilityCooldown: Double {
        return aAbilityCooldownPerTier[aAbilityTier]! /  (1 + dataSource.attacker.cooldownReduction)
    }
    
    //B ability
    
    var bAbilityDamage: Double {
        let x = bAbilityDamagePerTier[bAbilityTier]!
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var bAbilityStunDuration: Double {
        return bAbilityStunDurationPerTier[bAbilityTier]!
    }
    
    var bAbilityCooldown: Double {
        return bAbilityCooldownPerTier[bAbilityTier]! /  (1 + dataSource.attacker.cooldownReduction)
    }
    
    //ult
    
    var ultLeadStarDamage: Double {
        let x = ultLeadStarDamagePerTier[ultTier]! + dataSource.attacker.crystalPower
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var ultSmallerStarDamage: Double {
        let x = ultStarDamagePerTier[ultTier]! + dataSource.attacker.crystalPower * 0.2
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
}
