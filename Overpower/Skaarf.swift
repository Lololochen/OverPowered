//
//  Skaarf.swift
//  OverPowered
//
//  Created by yy on 2017/8/15.
//  Copyright © 2017年 Bright Future. All rights reserved.
//

import Foundation

struct Skaarf {
    
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
    
    let aAbilityCooldownPerTier: [Int : Double] = [1 : 6, 2 : 5.5, 3 : 5, 4 : 4.5, 5 : 3]
    let aAbilityDamagePerTier: [Int : Double] = [1 : 75, 2 : 135, 3 : 195, 4 : 255, 5 : 315]
    let aAbilityFireBallSpeedPerTier: [Int : Double] = [1 : 9, 2 : 9.5, 3 : 10, 4 : 10.5, 5 : 11]
    let aAbilityCpRatio = 1.5
    
    let bAbilityCooldownPerTier: [Int : Double] = [1 : 10, 2 : 10, 3 : 10, 4 : 10, 5 : 8]
    let bAbilityIgniteDamagePerTier: [Int : Double] = [1 : 40, 2 : 60, 3 : 80, 4 : 100, 5 : 120]
    let bAbilityDpsPerTier: [Int : Double] = [1 : 60, 2 : 100, 3 : 140, 4 : 180, 5 : 220]
    let bAbilityBurnDurationPerTier: [Int : Double] = [1 : 8, 2 : 8, 3 : 8, 4 : 8, 5 : 10]
    let bAbilityIgniteCrystalRatio = 0.7
    let bAbilityDpsCrystalRatio = 1.4
    
    let ultDamagePerTier: [Int : Double] = [1 : 650, 2 : 925, 3 : 1200]
    let ultCpRatio = 3.0
    let ultShieldPiercePerTier: [Int : Double] = [1 : 0.15, 2 : 0.3, 3 : 0.45]
    let ultFortifiedHealthPerTier: [Int : Double] = [1 : 150, 2 : 250, 3 :350]
    
    //A ability
    
    var aAbilityDamage: Double {
        let x = aAbilityDamagePerTier[aAbilityTier]! + dataSource.attacker.crystalPower * aAbilityCpRatio
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var aAbilityMaxDPSWithBasicAttacks: Double {
        let basicAttackDPS = DPSCalculator(dataSource: dataSource).dps
        let abilityDPS = aAbilityDamage / aAbilityCooldown
        return basicAttackDPS + abilityDPS
    }
    
    var aAbilityFireBallTravelTime: Double {
        return 12.5 / aAbilityFireBallSpeedPerTier[aAbilityTier]!
    }
    
    var aAbilityCooldown: Double {
        return aAbilityCooldownPerTier[aAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //B ability
    
    var bAbilityIgniteDamage: Double {
        let x = bAbilityIgniteDamagePerTier[bAbilityTier]! + dataSource.attacker.crystalPower * bAbilityIgniteCrystalRatio
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var bAbilityDps: Double {
        let x = bAbilityDpsPerTier[bAbilityTier]! + dataSource.attacker.crystalPower * bAbilityDpsCrystalRatio
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    var bAbilityBurnDuration: Double {
        return bAbilityBurnDurationPerTier[bAbilityTier]!
    }
    
    var bAbilityCooldown: Double {
        return bAbilityCooldownPerTier[bAbilityTier]! / (1 + dataSource.attacker.cooldownReduction)
    }
    
    //ult
    
    var ultDamage: Double {
        let x = ultDamagePerTier[ultTier]! + dataSource.attacker.crystalPower * ultCpRatio
        let rawDamage = x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
        
        var shieldPierce = dataSource.attacker.shieldPierce + ultShieldPiercePerTier[ultTier]!
        if shieldPierce > 1 { shieldPierce = 1 }
        let trueDamage = rawDamage / (1 + dataSource.defender.shield / 100) * (1 - shieldPierce) + rawDamage * shieldPierce
        
        return DamageCalculator(dataSource: dataSource).receivedDamage(trueDamage)
    }
    
    var ultDps: Double {
        return ultDamage / 3
    }
    
    var ultFortifiedHealth: Double {
        return ultFortifiedHealthPerTier[ultTier]!
    }
}