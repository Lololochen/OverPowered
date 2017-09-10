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
    let aAbilityShootDamagePerTier: [Int : Double] = [1: 80, 2 : 135, 3 : 190, 4 : 245, 5 : 300]
    let aAbilitySuperNovaDamagePerTier: [Int : Double] = [1 : 130, 2 : 185, 3 : 240, 4 : 295, 5 : 350]
    let aAbilityRangePerTier: [Int : Double] = [1 : 7, 2 : 7, 3 : 7, 4 : 7, 5 : 9]
    
    let bAbilityCooldownPerTier: [Int : Double] = [1 : 14, 2 : 13, 3 : 12, 4 : 11, 5 : 9]
    let bAbilityDamagePerTier: [Int : Double] = [1 : 100, 2 : 175, 3 : 250, 4 : 325, 5 : 475]
    let bAbilityStunDurationPerTier: [Int : Double] = [1 : 1, 2 : 1, 3 : 1, 4 : 1, 5 : 1.5]
    
    let ultLeadStarDamagePerTier: [Int : Double] = [1 : 300, 2 : 325, 3 : 350]
    let ultStarDamagePerTier: [Int : Double] = [1 : 150, 2 : 160, 3 : 170]
    let ultNumberOfStarsPerTier: [Int : Double] = [1 : 3, 2 : 5, 3 : 7]
    
    //A ability
    
    var aAbilityInitialRawDamage: Double {
        let x = aAbilityShootDamagePerTier[aAbilityTier]! + dataSource.attacker.crystalPower * 0.9
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var aAbilityExplosionRawDamage: Double {
        let x = aAbilitySuperNovaDamagePerTier[aAbilityTier]! + dataSource.attacker.crystalPower * 2.2
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var aAbilityCooldown: Double {
        return aAbilityCooldownPerTier[aAbilityTier]! /  (1 + dataSource.attacker.cooldownReduction)
    }
    
    //B ability
    
    var bAbilityRawDamage: Double {
        let x = bAbilityDamagePerTier[bAbilityTier]!
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var bAbilityCooldown: Double {
        return bAbilityCooldownPerTier[bAbilityTier]! /  (1 + dataSource.attacker.cooldownReduction)
    }
    
    //ult
    
    var ultLeadStarRawDamage: Double {
        let x = ultLeadStarDamagePerTier[ultTier]! + dataSource.attacker.crystalPower
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var ultSmallerStarRawDamage: Double {
        let x = ultStarDamagePerTier[ultTier]! + dataSource.attacker.crystalPower * 0.2
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
}
