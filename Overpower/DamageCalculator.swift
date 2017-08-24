//
//  DamageCalculator.swift
//  OverPowered
//
//  Created by Bright Future on 23/03/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

// how to calculate basic attacks needed to kill a wolf of Fortress?

struct DamageCalculator {
    
    var dataSource: DataSource
    
    func weaponDamage(_ rawDamage: Double) -> Double {
        return rawDamage / (1 + dataSource.defender.armor / 100) * (1 - dataSource.attacker.armorPierce) + rawDamage * dataSource.attacker.armorPierce
    }
    
    func crystalDamage(_ rawDamage: Double) -> Double {
        return rawDamage / (1 + dataSource.defender.shield / 100) * (1 - dataSource.attacker.shieldPierce) + rawDamage * dataSource.attacker.shieldPierce
    }
    
    func receivedCrystalDamageWithBrokenMythsPassive(_ crystalStrength: Double) -> Double {
        let rawDamage = crystalStrength * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
        let trueDamage = crystalDamage(rawDamage)
        return receivedDamage(trueDamage)
    }
    
    func receivedWeaponDamage(_ weaponStrength: Double) -> Double {
        let trueDamage = self.weaponDamage(weaponStrength)
        return receivedDamage(trueDamage)
    }
    
    func receivedDamage(_ damage: Double) -> Double {
        return damage / dataSource.defender.heroPower.hero!.defenseModifier
    }
    
}

struct MaxHealthDamageCalculator {
    
    var dataSource: DataSource
    var maxHealthRatio: Double
    
    var weaponDamage: Double {
        let rawDamage = maxHealthRatio * dataSource.defender.health
        let trueDamage = DamageCalculator(dataSource: dataSource).weaponDamage(rawDamage)
        return DamageCalculator(dataSource: dataSource).receivedDamage(trueDamage)
    }
    
    var crystalDamage: Double {
        let x = maxHealthRatio * dataSource.defender.health
        return DamageCalculator(dataSource: dataSource).receivedCrystalDamageWithBrokenMythsPassive(x)
    }
    
    func afterShockDamage() -> Double {
        let x = dataSource.defender.health * 0.15
        let y = x * (1 + Double(dataSource.attacker.buildPower.brokenMythStack) * 0.04)
        let trueDamage = DamageCalculator(dataSource: dataSource).crystalDamage(y)
        return DamageCalculator(dataSource: dataSource).receivedDamage(trueDamage)
    }

}
