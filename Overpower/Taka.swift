//
//  Taka.swift
//  OverPowered
//
//  Created by yy on 2017/8/9.
//  Copyright © 2017年 Bright Future. All rights reserved.
//

import Foundation

struct Taka {
    
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
    
    let perkCDR = 0.25
    
    let aAbilityDamagePerTier: [Int : Double] = [1 : 100, 2 : 165, 3 : 230, 4 : 295, 5 : 360]
    let aAbilityCooldownPerTier: [Int : Double] = [1 : 15, 2 : 15, 3 : 15, 4 : 15, 5 : 15]
    
    let bAbilityHealPerSec: [Int : Double] = [1 : 25, 2 : 40, 3 : 55, 4 : 70, 5 : 100]
    let bAbilityStealthDurationPerTier: [Int : Double] = [1 : 3, 2 : 3.2, 3 : 3.4, 4 : 3.6, 5 : 4]
    let bAbilityCooldownPerTier: [Int : Double] = [1 : 25, 2 : 24, 3 : 23, 4 : 22, 5 : 21]
    
    let ultPrimaryDamagePerTier: [Int : Double] = [1 : 250, 2 : 400, 3 : 500]
    let ultBleedPerSecPerTier: [Int : Double] = [1 : 40, 2 : 50, 3 : 60]
    let ultCooldownPerTier: [Int : Double] = [1 : 20, 2 : 20, 3 : 20]
    
    
    var aAbilityRawDamage: Double {
        let x = aAbilityDamagePerTier[aAbilityTier]! + dataSource.attacker.crystalPower * 0.8
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var aAbilityCooldown: Double {
        return aAbilityCooldownPerTier[aAbilityTier]! / (1 + dataSource.attacker.cooldownReduction + Double(dataSource.attacker.heroPower.kiStack) * perkCDR)
    }
    
    var bAbilityHeal: Double {
        return (bAbilityHealPerSec[bAbilityTier]! + dataSource.attacker.crystalPower * 0.25) * 4
    }

    var bAbilityCooldown: Double {
        return bAbilityCooldownPerTier[bAbilityTier]! / (1 + dataSource.attacker.cooldownReduction + Double(dataSource.attacker.heroPower.kiStack) * perkCDR)
    }
    
    var ultInitialRawDamage: Double {
        let x = ultPrimaryDamagePerTier[ultTier]! + dataSource.attacker.crystalPower * 1.7
        return x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var ultBleedRawDamage: Double {
        let rawDamagePerSec = ultBleedPerSecPerTier[ultTier]! + dataSource.attacker.crystalPower * 0.7
        let rawDamage = rawDamagePerSec * 3
        return rawDamage * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var ultTotalRawDamage: Double {
        return ultInitialRawDamage + ultBleedRawDamage
    }
    
    var ultCooldown: Double {
        return ultCooldownPerTier[ultTier]! / (1 + dataSource.attacker.cooldownReduction + Double(dataSource.attacker.heroPower.kiStack) * perkCDR)
    }

}
