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
    
    var aAbilityRawCrystalDamage: Double {
        let x = dataSource.attacker.crystalPower * 0.5
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var aAbilityCooldown: Double {
        return aAbilityCooldownPerTier[aAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //B ability
    
    var bAbilityRawCrystalDamage: Double {
        let x = bAbilityDamagePerTier[bAbilityTier]! + dataSource.attacker.crystalPower * 1.8
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var bAbilityRawWeaponDamage: Double {
        return dataSource.attacker.buildPower.weaponPower * 1
    }
    
    var bAbilitySlowFactor: Double {
        return bAbilitySlowPerTier[bAbilityTier]! * (1 + Double(dataSource.attacker.heroPower.heartthrobStack) * 0.4) / 2
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
    
    var ultRawCrystalDamage: Double {
        let x = dataSource.attacker.crystalPower * 0.5
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var ultChargeTime: Double {
        return ultChargeTimePerTier[ultTier]! / (1 + dataSource.attacker.cooldownReduction)
    }

}
