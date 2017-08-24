//
//  DPS.swift
//  OverPowered
//
//  Created by Bright Future on 03/03/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

struct DPSCalculator {
        
    var dataSource: DataSource
    
    var weaponDamagePerHit: Double {
        return BasicAttackDamage(dataSource: dataSource).weaponDamagePerHit
    }
    var crystalDamagePerHit: Double {
        return BasicAttackDamage(dataSource: dataSource).crystalDamagePerHit
    }
    
    var maxHitsPerSec: Double {
        return dataSource.attacker.attackSpeed / dataSource.attacker.attackCooldown
    }
    
    func calcDamageWithTensionBow(fightDuration: Double) -> Double {

        dataSource.attacker.buildPower.tensionBowBuffed = true
        let tensionBowDamage = BasicAttackDamage(dataSource: dataSource).weaponDamagePerHit
        
        dataSource.attacker.buildPower.tensionBowBuffed = false
        let normalDamage = weaponDamagePerHit
        
        let numberOfHits = DPSCalculator(dataSource: dataSource).maxHitsPerSec * dataSource.attacker.fightDuration
        let totalDamage = (numberOfHits - 1) * normalDamage + tensionBowDamage
        return totalDamage / dataSource.attacker.fightDuration
    }
    
    var weaponDPS: Double {
        if dataSource.attacker.buildPower.build.contains(Item.tensionBow) {
            return calcDamageWithTensionBow(fightDuration: dataSource.attacker.fightDuration)
        } else {
            return DPSCalculator(dataSource: dataSource).maxHitsPerSec * weaponDamagePerHit
        }
    }
    
    var crystalDPS: Double {
        return crystalDamagePerHit * DPSCalculator(dataSource: dataSource).maxHitsPerSec
    }
    
    var trueDamageDPS: Double {
        if dataSource.attacker.buildPower.build.contains(.stormcrown) {
            return (Double(dataSource.attacker.heroPower.level! - 1) * 100 / 11 + 40) * 0.15
        }
        if dataSource.attacker.buildPower.build.contains(.stormguardBanner) {
            return (Double(dataSource.attacker.heroPower.level! - 1) * 50 / 11 + 20) * 0.15
        }
        return 0
    }
    
    var dps: Double {
        return weaponDPS + crystalDPS + trueDamageDPS
    }
    
}

