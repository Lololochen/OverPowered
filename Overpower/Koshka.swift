//
//  Koshka.swift
//  OverPowered
//
//  Created by yy on 2017/8/12.
//  Copyright © 2017年 Bright Future. All rights reserved.
//

import Foundation

struct Koshka {
    
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
    let aAbilityDamagePerTier: [Int : Double] = [1 : 30, 2 : 35, 3 : 40, 4 : 45, 5 : 55]
    let aAbilityCpRatio = 1.3
    
    let bAbilityCooldownPerTier: [Int : Double] = [1 : 6, 2 : 6, 3 : 6, 4 : 6, 5 : 5]
    let bAbilityDamagePerTier: [Int : Double] = [1 : 80, 2 : 120, 3 : 160, 4 : 200, 5 : 280]
    let bAbilityBuffDamagePerTier: [Int : Double] = [1 : 35, 2 : 50, 3 : 65, 4 : 80, 5 : 110]
    let bAbilityTwirlDamageCrystalRatio = 0.8
    let bAbilityBuffDamageCrystalRatio = 1.2
    
    let ultDamagePerTier: [Int : Double] = [1 : 350, 2 : 575, 3 : 800]
    let ultCpRatio = 1.2
    
    //A ability
    
    var aAbilityRawDamage: Double {
        let x = aAbilityDamagePerTier[aAbilityTier]! + dataSource.attacker.crystalPower * aAbilityCpRatio
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var aAbilityCooldown: Double {
        return aAbilityCooldownPerTier[aAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //B ability
    
    var bAbilityTwirlRawDamage: Double {
        let x = bAbilityDamagePerTier[bAbilityTier]! + dataSource.attacker.crystalPower * bAbilityTwirlDamageCrystalRatio
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var bAbilityEmpoweredRawDamage: Double {
        let x = bAbilityBuffDamagePerTier[bAbilityTier]! + dataSource.attacker.crystalPower * bAbilityBuffDamageCrystalRatio
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var bAbilityCooldown: Double {
        return bAbilityCooldownPerTier[bAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //ult
    
    var ultRawDamage: Double {
        let x = ultDamagePerTier[ultTier]! + dataSource.attacker.crystalPower * ultCpRatio
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
}
