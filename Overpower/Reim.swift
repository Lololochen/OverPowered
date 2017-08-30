//
//  Reim.swift
//  OverPowered
//
//  Created by yy on 2017/8/15.
//  Copyright © 2017年 Bright Future. All rights reserved.
//

import Foundation

struct Reim {
    
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
    
    let aAbilityCdPerTier: [Int : Double] = [1 : 4, 2 : 3.5, 3 : 3, 4 : 2.5, 5 : 2]
    let aAbilityRangePerTier: [Int : Double] = [1 : 5, 2 : 5.5, 3 : 6, 4 : 6.5, 5 : 7.5]
    let aAbilityFirstHitDamagePerTier: [Int : Double] = [1 : 80, 2 : 120, 3 : 160, 4 : 200, 5 : 240]
    let aAbilitySecondHitDamagePerTier: [Int : Double] = [1 : 80, 2 : 120, 3 : 160, 4 : 200, 5 : 240]
    
    let bAbilityCdPerTier: [Int : Double] = [1 : 14, 2 : 13, 3 : 12, 4 : 11, 5 : 7]
    let bAbilityDamagePerTier: [Int : Double] = [1 : 80, 2 : 120, 3 : 160, 4 : 200, 5 : 280]
    let bAbilityCpRatio = 0.4
    let bAbilityRootDurationPerTier: [Int : Double] = [1 : 0.6, 2 : 0.8, 3 : 1, 4 : 1.2, 5 : 1.4]
    
    let ultCenterDamagePerTier: [Int : Double] = [1 : 250, 2 : 375, 3 : 500]
    let ultEdgeDamagePerTier: [Int : Double] = [1 : 200, 2 : 300, 3 : 400]
    let ultCenterSlowDurationPerTier: [Int : Double] = [1 : 3, 2 : 4.5, 3 : 6]
    let ultEdgeSlowDurationPerTier: [Int : Double] = [1 : 2, 2 : 3, 3 : 4]
    let ultSlowPerTier: [Int : Double] = [1 : 0.6, 2 : 0.7, 3 : 0.8]
    let ultStunDurationPerTier: [Int : Double] = [1 : 0.8, 2 : 1, 3 : 1.2]
    
    
    //A ability
    
    var aAbilityFirstHitRawDamage: Double {
        let x = aAbilityFirstHitDamagePerTier[aAbilityTier]! + dataSource.attacker.crystalPower * 1.0
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var aAbilityShatterRawDamage: Double {
        let x = aAbilitySecondHitDamagePerTier[aAbilityTier]! + dataSource.attacker.crystalPower * 1.4
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var aAbilityRawFullDamageOnChilledEnemy: Double {
        return (aAbilityFirstHitRawDamage + aAbilityShatterRawDamage) * 1.25
    }
    
    var aAbilityCooldown: Double {
        return aAbilityCdPerTier[aAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //B ability
    
    var bAbilityRawDamage: Double {
        let x = bAbilityDamagePerTier[bAbilityTier]! + dataSource.attacker.crystalPower * bAbilityCpRatio
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var bAbilityCooldown: Double {
        return bAbilityCdPerTier[bAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //ult
    
    var ultCenterRawDamage: Double {
        let x = ultCenterDamagePerTier[ultTier]! + dataSource.attacker.crystalPower * 1.25
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var ultEdgeRawDamage: Double {
        let x = ultEdgeDamagePerTier[ultTier]! + dataSource.attacker.crystalPower * 1.0
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var ultCenterSlowFactor: Double {
        return ultCenterSlowDurationPerTier[ultTier]! * ultSlowPerTier[ultTier]!
    }
    
    var ultEdgeSlowFactor: Double {
        return ultEdgeSlowDurationPerTier[ultTier]! * ultSlowPerTier[ultTier]!
    }
    
}
