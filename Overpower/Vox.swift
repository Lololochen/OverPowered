//
//  VoxA.swift
//  OverPowered
//
//  Created by Bright Future on 23/03/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

struct Vox {
    
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
    
    let aAbilityCDPerTier: [Int : Double] = [1 : 5, 2 : 4.5, 3 : 4, 4 : 3.5, 5 : 3]
    let bAbilityCDPerTier: [Int : Double] = [1 : 10, 2 : 10, 3 : 10, 4 : 10, 5 : 7]
    let bounceDamageBonusPerTier: [Int : Double] = [1 : 20, 2 : 40, 3 : 60, 4 : 80, 5 : 120]
    let basicAttackDamageRatioPerTier: [Int : Double] = [1 : 0.5, 2 : 0.5, 3 : 0.5, 4 : 0.5, 5 : 0.6]
    let slowAtCenterPerTier: [Int : Double] = [1 : 0.15, 2 : 0.17, 3 : 0.19, 4 : 0.21, 5 : 0.25]
    let slowAtEdgePerTier: [Int : Double] = [1 : 0.1, 2 : 0.12, 3 : 0.14, 4 : 0.16, 5 : 0.2]
    let ultInitialDamagePerTier: [Int : Double] = [1 : 100, 2 : 150, 3 : 200]
    let shockwaveDamagePerTier: [Int : Double] = [1 : 100, 2 : 150, 3 : 200]
    
    var maxHitsPerSec: Double {
        return DPSCalculator(dataSource: dataSource).maxHitsPerSec + basicAttackDamageRatioPerTier[aAbilityTier]! * 2 / aAbilityCDPerTier[aAbilityTier]!
    }

    var dpsWithAAbility: Double {
        let weaponDamagePerHit = BasicAttackDamage(dataSource: dataSource).weaponDamagePerHit
        let crystalDamagePerHit = BasicAttackDamage(dataSource: dataSource).crystalDamagePerHit
        
        let weaponDPS = maxHitsPerSec * weaponDamagePerHit
        let crystalDPS = crystalDamagePerHit * maxHitsPerSec
        
        return weaponDPS + crystalDPS
    }
    
    var aAbilityCooldown: Double {
        return aAbilityCDPerTier[aAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    var bounceDPS: Double {
        let bounceHitsPerSec = DPSCalculator(dataSource: dataSource).maxHitsPerSec +  2 / aAbilityCDPerTier[aAbilityTier]!
        let bounceDamage = 20 + bounceDamageBonusPerTier[bAbilityTier]! + 0.9 * dataSource.attacker.crystalPower
        let trueDamage = DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(bounceDamage)
        return trueDamage * bounceHitsPerSec
    }
    
    var bAbilitySlowAtCenter: Double {
        return slowAtCenterPerTier[bAbilityTier]!
    }
    
    var bAbilitySlowAtEdge: Double {
        return slowAtEdgePerTier[bAbilityTier]!
    }
    
    var bAbilityCooldown: Double {
        return bAbilityCDPerTier[bAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    var ultInitialDamage: Double {
        let x = ultInitialDamagePerTier[ultTier]! + dataSource.attacker.crystalPower * 0.2
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var ultTotalDamage: Double {
        let x = shockwaveDamagePerTier[ultTier]! + dataSource.attacker.crystalPower * 0.4
        let shockwaveDamage = DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
        return shockwaveDamage + ultInitialDamage
    }
    
}
