//
//  Ardan.swift
//  OverPowered
//
//  Created by yy on 2017/8/10.
//  Copyright © 2017年 Bright Future. All rights reserved.
//

import Foundation

struct Ardan {
    
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
    
    let aAbilityCdPerTier: [Int : Double] = [1 : 13, 2 : 13, 3 : 13, 4 : 13, 5 : 13]
    let aAbilityRangePerTier: [Int : Double] = [1 : 7, 2 : 7, 3 : 7, 4 : 7, 5 : 8.5]
    let aAbilityDamagePerTier: [Int : Double] = [1 : 50, 2 : 100, 3 : 150, 4 : 200, 5 : 250]
    let aAbilityCpRatio = 1.2
    let aAbilityBarrierPerTier: [Int : Double] = [1 : 50, 2 : 80, 3 : 110, 4 : 140, 5 : 170]
    
    let bAbilityCdPerTier: [Int : Double] = [1 : 20, 2 : 20, 3 : 20, 4 : 20, 5 : 20]
    let bAbilityRangePerTier: [Int : Double] = [1 : 5, 2 : 5, 3 : 5, 4 : 5, 5 : 7]
    let bAbilityDamagePerTier: [Int : Double] = [1 : 30, 2 : 70, 3 : 110, 4 : 150, 5 : 190]
    let bAbilityCpRatio = 0.7
    
    let ultDamagePerTier: [Int : Double] = [1 : 250, 2 : 375, 3 : 500]
    let ultDurationPerTier: [Int : Double] = [1 : 4, 2 : 6, 3 : 8]
    let ultCpRatio = 3.5
    let ultGauntletDurationPerTier = [1 : 4, 2 : 6, 3 : 8]
    
    //A ability
    
    var aAbilityDamage: Double {
        let x = aAbilityDamagePerTier[aAbilityTier]! + dataSource.attacker.crystalPower * aAbilityCpRatio
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var aAbilityRange: Double {
        return aAbilityRangePerTier[aAbilityTier]!
    }
    
    var aAbilityBarrier: Double {
        return aAbilityBarrierPerTier[aAbilityTier]! + dataSource.attacker.buildPower.health * 0.25
    }
    
    var aAbilityCooldown: Double {
        return aAbilityCdPerTier[aAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //B ability
    
    var bAbilityCpDamage: Double {
        let x = bAbilityDamagePerTier[bAbilityTier]! + dataSource.attacker.crystalPower * bAbilityCpRatio
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var bAbilityDamage: Double {
        let basicAttackDamage = BasicAttackDamage(dataSource: dataSource).damage
        return bAbilityCpDamage + basicAttackDamage
    }
    
    var bAbilityCooldown: Double {
        return bAbilityCdPerTier[bAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //ult
    
    var ultDamage: Double {
        let x = ultDamagePerTier[ultTier]! + dataSource.attacker.crystalPower * ultCpRatio
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var ultDuration: Double {
        return ultDurationPerTier[ultTier]!
    }
}
