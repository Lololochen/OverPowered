//
//  Grumpjaw.swift
//  OverPowered
//
//  Created by yy on 2017/8/11.
//  Copyright © 2017年 Bright Future. All rights reserved.
//

import Foundation

struct Grumpjaw {
    
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
    
    let aAbilityCdPerTier: [Int : Double] = [1 : 12, 2 : 11, 3 : 10, 4 : 9, 5 : 8]
    let aAbilityDamagePerTier: [Int : Double] = [1 : 75, 2 : 125, 3 : 175, 4 : 225, 5 : 325]
    let aAbilityBonusDamagePerStackPerTier: [Int : Double] = [1 : 20, 2 : 35, 3 : 50, 4 : 65, 5 : 95]
    let aAbilityCpRatio = 0.5
    let aAbilityPerStackDamageCrystalRatio = 0.1
    
    let bAbilityCdPerTier: [Int : Double] = [1 : 9, 2 : 9, 3 : 9, 4 : 9, 5 : 9]
    let bAbilityEmpoweredDuration: [Int : Double] = [1 : 4, 2 : 4, 3 : 4, 4 : 4, 5 : 5]
    let bAbilityDamagePerTier: [Int : Double] = [1 : 20, 2 : 40, 3 : 60, 4 : 80, 5 : 100]
    let bAbilityAttackSpeedPerTier: [Int : Double] = [1 : 0.2, 2 : 0.3, 3 : 0.4, 4 : 0.5, 5 : 0.6]
    let bAbilityBonusDamageCrystalRatio = 0.8
    
    let ultDamagePerTier: [Int : Double] = [1 : 400, 2 : 550, 3 : 700]
    let ultCpRatio = 2.0
    
    //A ability
    
    var aAbilityNoStackDamage: Double {
        let x = aAbilityDamagePerTier[aAbilityTier]! + dataSource.attacker.crystalPower * aAbilityCpRatio
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var aAbilityBonusDamagePerStack: Double {
        let x = aAbilityBonusDamagePerStackPerTier[aAbilityTier]! + dataSource.attacker.crystalPower * aAbilityCpRatio
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var aAbilityFullStackDamage: Double {
        return aAbilityNoStackDamage + aAbilityBonusDamagePerStack * 5
    }
    
    var aAbilityCooldown: Double {
        return aAbilityCdPerTier[aAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //B ability
    
    var bAbilityDps: Double {
        dataSource.attacker.heroPower.empoweredWeaponPower = bAbilityDamagePerTier[bAbilityTier]!
        dataSource.attacker.heroPower.empoweredAttackSpeed = bAbilityAttackSpeedPerTier[bAbilityTier]!
        let otherDPS = DPSCalculator(dataSource: dataSource).dps
        
        let crystalDPS = bAbilityBonusDamageCrystalRatio * dataSource.attacker.crystalPower * DPSCalculator(dataSource: dataSource).maxHitsPerSec
        return otherDPS + crystalDPS
    }
    
    var bAbilityCooldown: Double {
        return bAbilityCdPerTier[bAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //ult
    
    var ultDamage: Double {
        let x = ultDamagePerTier[ultTier]! + dataSource.attacker.crystalPower * ultCpRatio
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
}
