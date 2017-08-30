//
//  Phinn.swift
//  OverPowered
//
//  Created by yy on 2017/8/13.
//  Copyright © 2017年 Bright Future. All rights reserved.
//

import Foundation

struct Phinn {
    
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
    
    let aAbilityCdPerTier: [Int : Double] = [1 : 9, 2 : 8, 3 : 7, 4 : 6, 5 : 5]
    let aAbilityDamagePerTier: [Int : Double] = [1 : 160, 2 : 270, 3 : 380, 4 : 490, 5 : 600]
    let aAbilityCpRatio = 1.7
    
    let bAbilityCdPerTier: [Int : Double] = [1 : 10, 2 : 10, 3 : 10, 4 : 10, 5 : 10]
    let bAbilityDamagePerTier: [Int : Double] = [1 : 60, 2 : 120, 3 : 180, 4 : 240, 5 : 360]
    let bAbilityCpRatio = 1.2
    let bAbilityDurationPerTier: [Int : Double] = [1 : 3, 2 : 3, 3 : 3, 4 : 3, 5 : 4]
    let bAbilityFortifiedHealthPerTier: [Int : Double] = [1 : 120, 2 : 150, 3 : 180, 4 : 210, 5 : 270]
    
    let ultDamagePerTier: [Int : Double] = [1 : 100, 2 : 300, 3 : 500]
    let ultCpRatio = 1.5
    
    //A ability
    
    var aAbilityRawDamage: Double {
        let x = aAbilityDamagePerTier[aAbilityTier]! + dataSource.attacker.crystalPower * aAbilityCpRatio
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var aAbilityCooldown: Double {
        return aAbilityCdPerTier[aAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //B ability
    
    var bAbilityRawDamage: Double {
        let x = bAbilityDamagePerTier[bAbilityTier]! + dataSource.attacker.crystalPower * bAbilityCpRatio
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var bAbilityFortifiedHealth: Double {
        return bAbilityFortifiedHealthPerTier[bAbilityTier]! + dataSource.attacker.buildPower.health * 0.06
    }
    
    var bAbilityArmorIncrease: Double {
        return dataSource.attacker.buildPower.armor * 0.2
    }
    
    var bAbilityShieldIncrease: Double {
        return dataSource.attacker.buildPower.shield * 0.2
    }
    
    var bAbilityCooldown: Double {
        return bAbilityCdPerTier[bAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //ult
    
    var ultRawDamage: Double {
        let x = ultDamagePerTier[ultTier]! + dataSource.attacker.crystalPower * ultCpRatio
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
}
