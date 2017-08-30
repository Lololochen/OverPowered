//
//  Gwen.swift
//  OverPowered
//
//  Created by yy on 2017/8/11.
//  Copyright © 2017年 Bright Future. All rights reserved.
//

import Foundation

struct Gwen {
    
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
    
    let aAbilityCdPerTier: [Int : Double] = [1 : 12, 2 : 11, 3 : 10, 4 : 9, 5 : 5]
    let aAbilityDamagePerTier: [Int : Double] = [1 : 60, 2 : 100, 3 : 140, 4 : 180, 5 : 220]
    let aAbilitySlowPerTier: [Int : Double] = [1 : 0.4, 2 : 0.45, 3 : 0.5, 4 : 0.55, 5 : 0.65]
    let aAbilityWpRatio: Double = 0.45
    let aAbilityCpRatio: Double = 2.1
  
    let bAbilityCooldownPerTier: [Int : Double] = [1 : 24, 2 : 22, 3 : 20, 4 : 18, 5 : 14]
    let bAbilitySpeedBoostPerTier: [Int : Double] = [1 : 1.2, 2 : 1.4, 3 : 1.6, 4 : 1.8, 5 : 2.2]
    
    let ultDamagePerTier: [Int : Double] = [1 : 250, 2 : 400, 3 : 550]
    let ultStunDurationPerTier: [Int : Double] = [1 : 1, 2 : 1.2, 3 : 1.4]
    let ultWpRatio: Double = 1
    let ultCpRatio: Double = 2.4
    
    var empoweredBasicAttackRawWeaponDamage: Double {
        let originalDamage = BasicAttackDamage(dataSource: dataSource).rawWeaponDamagePerHit
        return 80 / 11 * Double(dataSource.attacker.heroPower.level!) + 30 + originalDamage * 1.35
    }
    
    //A ability
    
    var aAbilityRawCrystalDamage: Double {
        let x = dataSource.attacker.crystalPower * aAbilityCpRatio
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var aAbilityRawWeaponDamage: Double {
        return aAbilityDamagePerTier[aAbilityTier]! + dataSource.attacker.buildPower.weaponPower * aAbilityWpRatio
    }
    
    var aAbilitySlowFactor: Double {
        return aAbilitySlowPerTier[aAbilityTier]! * 1
    }
    
    var aAbilityCooldown: Double {
        return aAbilityCdPerTier[aAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //B ability
    
    var bAbilitySpeedBoostDistance: Double {
        return bAbilitySpeedBoostPerTier[bAbilityTier]!
    }
    
    var bAbilityCooldown: Double {
        return bAbilityCooldownPerTier[bAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //ult
    
    var ultRawCrystalDamage: Double {
        let x = dataSource.attacker.crystalPower * ultCpRatio
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var ultRawWeaponDamage: Double {
        return ultDamagePerTier[ultTier]! + dataSource.attacker.buildPower.weaponPower * ultWpRatio
    }
    
}
