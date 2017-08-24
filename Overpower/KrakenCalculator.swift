//
//  KrakenCalculator.swift
//  Overpower
//
//  Created by Bright Future on 14/10/2016.
//  Copyright © 2016 Bright Future. All rights reserved.
//

import Foundation

class KrakenCalculator {
    
    var emptyItem = Items(name: "Empty Item", price: 0, image: #imageLiteral(resourceName: "EmptyItem"))
    let players = (playerA: Player(), playerB: Player(), playerC: Player())
    let krakenArmor: Double = 200
    var shrededKrakenArmor = 0.0
    let krakenShield: Double = 200
    let krakenBaseHP: Double = 4000
    var totalGold: Double = 0
    var krakenHP: Double {
        return krakenBaseHP + totalGold * 0.3
    }
    
    func calcPlayerDPS(player: Player) -> Double {
        
        shredKrakenArmor()

        var weaponDPS = 0.0
        var crystalDPS = 0.0
        let CPMultiplier = 1.3
        // calculate weaponDPS in the bottom to account for alternating current's attack speed
        
        let buildPower = calcBuildPower(of: player)
        let weaponPower = player.weaponPower + buildPower.weaponPower
        var attackSpeed = player.attackSpeed + buildPower.attackSpeed
        let critChance = player.critChance + buildPower.critChance
        let critDamage = player.critDamage + buildPower.critDamage
        let armorPierce = player.armorPierce + buildPower.armorPierce
        let crystalPower = player.crystalPower + buildPower.crystalPower
        let abilityCooldown = player.abilityCooldown + buildPower.abilityCooldown
        let shieldPierce = player.shieldPierce + buildPower.shieldPierce
        let trueDamage = player.trueDamage + buildPower.trueDamage
        
        if player.build.contains(where: {item in item === WeaponItem.tensionBow}) {
            weaponDPS += 30
        }
        
        crystalDPS = crystalPower * abilityCooldown * CPMultiplier

        if player.build.contains(where: {item in item === CrystalItem.aftershock}) {
            // assumes 400 damage each time
            crystalDPS += 400/6
        }
        if player.build.contains(where: {item in item === CrystalItem.alternatingCurrent}) {
            attackSpeed += 0.65
            crystalDPS += crystalDPS * 0.35 * attackSpeed / 1.3 * 0.8
            // multiply by 0.8 to makeup for the time used for abilities
        }
        
        weaponDPS += (1 + critChance * critDamage) * weaponPower * attackSpeed / 1.4
        let trueWeaponDPS = armorPierce * weaponDPS + (1 - armorPierce) * weaponDPS / (1 + (krakenArmor - shrededKrakenArmor) / 100)
        let trueCrystalDPS = shieldPierce * crystalDPS + (1 - shieldPierce) * crystalDPS / (1 + krakenShield / 100)
        let trueDPS = trueDamage + trueWeaponDPS + trueCrystalDPS
        return trueDPS
        
    }
    
    func calcBuildPower(of player: Player) -> (weaponPower: Double, attackSpeed: Double, critChance: Double, critDamage: Double, armorPierce: Double, crystalPower: Double, abilityCooldown: Double, shieldPierce: Double, trueDamage: Double) {
        
        var (weaponPower, attackSpeed, critChance, critDamage, armorPierce, crystalPower, abilityCooldown, shieldPierce, trueDamage) = (0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
        for item in player.build {
            if let weaponItem = item as? WeaponItem {
                weaponPower += weaponItem.weaponPower
                attackSpeed += weaponItem.attackSpeed
                critChance += weaponItem.criticalChance
                critDamage += weaponItem.criticalDamage
                armorPierce += weaponItem.armorPierce
            }
            if let abilityItem = item as? CrystalItem {
                crystalPower += abilityItem.crystalPower
                abilityCooldown += abilityItem.cooldownReduction
                shieldPierce += abilityItem.shieldPierce
            }
            if item === CrystalItem.stormcrown {
                trueDamage = 120
            }
        }
        let buildPower = (weaponPower, attackSpeed, critChance, critDamage, armorPierce, crystalPower, abilityCooldown, shieldPierce, trueDamage)
        return buildPower
    }
    
    func calcCaptureTime() -> Double {
        let totalDPS = calcPlayerDPS(player: players.playerA) + calcPlayerDPS(player: players.playerB) + calcPlayerDPS(player: players.playerC)
        let capturnTime = krakenHP / totalDPS
        return capturnTime
    }
    
    func shredKrakenArmor() {
        let a = players.playerA.build.contains(where: {item in item === WeaponItem.bonesaw})
        let b = players.playerB.build.contains(where: {item in item === WeaponItem.bonesaw})
        let c = players.playerC.build.contains(where: {item in item === WeaponItem.bonesaw})
        if a || b || c {
            shrededKrakenArmor = krakenArmor * 0.06 * 7
        } else {
            shrededKrakenArmor = 0
        }
    }
}
