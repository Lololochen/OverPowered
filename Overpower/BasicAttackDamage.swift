//
//  BasicAttackDamage.swift
//  OverPowered
//
//  Created by Bright Future on 17/03/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

struct BasicAttackDamage {
    
    var dataSource: DataSource
    
    var weaponPowerWithCrit: Double {
        if dataSource.attacker.heroPower.hero == Hero.grace {
            let bonusWeaponPowerLow: Double = 20
            let bonusWeaponPowerHigh: Double = 108
            let bonusWeaponPowerRatio: Double = 0.3
            
            var averageWeaponPower: Double {
                let bonus = (bonusWeaponPowerHigh - bonusWeaponPowerLow) / 11 * Double(dataSource.attacker.heroPower.level!) + bonusWeaponPowerLow
                let weaponPower = dataSource.attacker.weaponPower + bonus / 2
                return weaponPower * (1 + dataSource.attacker.critDamage) * dataSource.attacker.critChance + weaponPower * (1 - dataSource.attacker.critChance)
            }
        }
        return dataSource.attacker.weaponPower * (1 + dataSource.attacker.critDamage) * dataSource.attacker.critChance + dataSource.attacker.weaponPower * (1 - dataSource.attacker.critChance)
    }
        
    private var rawWeaponDamagePerHit: Double {
        if dataSource.attacker.heroPower.hero == Hero.idris && dataSource.attacker.crystalPower >= 125 && dataSource.attacker.isMeleeFighting == true {
            return weaponPowerWithCrit * 0.5
        }
        if dataSource.attacker.heroPower.hero == Hero.taka && dataSource.attacker.heroPower.kiStack > 0 {
            let mortalStrikeCD = 5 - Double(dataSource.attacker.heroPower.kiStack) * 0.8
            let averageWeaponPower = (40 + 1.35 * weaponPowerWithCrit) / (mortalStrikeCD / dataSource.attacker.attackCooldown)
            return averageWeaponPower
        }
        
        return weaponPowerWithCrit
    }
    
    private var rawCrystalDamagePerHit: Double {
        var damage: Double = 0
        switch dataSource.attacker.heroPower.hero! {
            
        case Hero.blackfeather:
            damage += Double(dataSource.attacker.heroPower.heartthrobStack) * 2 + 0.15 * dataSource.attacker.crystalPower
            
        case Hero.celeste:
            let basicDamage = (115 - 65) / 12 * Double(dataSource.attacker.heroPower.level!) + 65
            let crystalRatioDamage = dataSource.attacker.crystalPower * 0.75
            damage += basicDamage + crystalRatioDamage
            
        case Hero.idris:
            if dataSource.attacker.crystalPower >= 125 {
                damage += dataSource.attacker.crystalPower * 1
            }
            
        case Hero.lyra:
            let basicDamage = (255 - 110) / 12 * Double(dataSource.attacker.heroPower.level!) + 120
            let crystalRatioDamage = dataSource.attacker.crystalPower * 0.9
            damage += basicDamage + crystalRatioDamage
            
        case Hero.reim:
            let basicDamage = (54 - 15) / 12 * Double(dataSource.attacker.heroPower.level!) + 15
            let crystalRatioDamage = dataSource.attacker.crystalPower * 0.9
            damage += basicDamage + crystalRatioDamage
            
        case Hero.skaarf:
            let x = (dataSource.defender.health + dataSource.attacker.crystalPower) * 0.03
            let damageOnBurningTarget = x * 2 * dataSource.attacker.critChance + x * (1 - dataSource.attacker.critChance)
            damage += damageOnBurningTarget
            
        default:
            break
        }
        if dataSource.attacker.buildPower.build.contains(Item.alternatingCurrent) {
            damage += dataSource.attacker.crystalPower * 0.35
        }
        return damage * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
    }
    
    var crystalDamagePerHit: Double {
        let trueDamage = DamageCalculator(dataSource: dataSource).crystalDamage(rawCrystalDamagePerHit)
        return DamageCalculator(dataSource: dataSource).receivedDamage(trueDamage)
    }
    
    var weaponDamagePerHit: Double {
        let trueDamage = DamageCalculator(dataSource: dataSource).weaponDamage(rawWeaponDamagePerHit)
        return DamageCalculator(dataSource: dataSource).receivedDamage(trueDamage)
    }
    
    var damage: Double {
        return weaponDamagePerHit + crystalDamagePerHit
    }
    
    var critDamage: Double {
        let x = dataSource.attacker.weaponPower * (1 + dataSource.attacker.critDamage)
        return DamageCalculator(dataSource: dataSource).receivedWeaponDamage(x)
    }

}
