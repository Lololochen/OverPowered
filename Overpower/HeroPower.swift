//
//  HeroPower.swift
//  OverPowered
//
//  Created by Bright Future on 03/03/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class HeroPower {
    
    var hero: Hero? {
        didSet {
            if hero != Hero.blackfeather {
                heartthrobStack = 0
            }
            if hero != Hero.taka {
                kiStack = 0
            }
            if hero != Hero.grumpjaw {
                livingArmorStack = 0
            }
            if hero != Hero.catherine {
                captainOfTheGuardStack = 0
            }
        }
    }
    var level: Int? {
        didSet {
            if level! > 12 { level = 12 }
            if level! < 1 { level = 1 }
        }
    }
    var weaponPower: Double {
        return (hero!.weaponPowerHigh - hero!.weaponPowerLow) / 11 * Double(level! - 1) + hero!.weaponPowerLow
    }
    var attackSpeed: Double {
        return (hero!.attackSpeedHigh - hero!.attackSpeedLow) / 11 * Double(level! - 1) + hero!.attackSpeedLow
    }
    var critChance: Double = 0
    var critDamage: Double = 0.5
    
    var armor: Double {
        return (hero!.armorHigh - hero!.armorLow) / 11 * Double(level! - 1) + hero!.armorLow
    }
    var shield: Double {
        return (hero!.shieldHigh - hero!.shieldLow) / 11 * Double(level! - 1) + hero!.shieldLow
    }
    var health: Double {
        return (hero!.HPHigh - hero!.HPLow) / 11 * Double(level! - 1) + hero!.HPLow
    }
    
    var aAbilityTier: Int!
    var bAbilityTier: Int!
    var ultTier: Int!
    
    var heartthrobStack: Int = 0
    var kiStack: Int = 0
    var livingArmorStack: Int = 0
    var captainOfTheGuardStack: Int = 0
    
}
