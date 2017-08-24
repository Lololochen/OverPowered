//
//  BaseStats.swift
//  OverPowered
//
//  Created by Bright Future on 27/12/2016.
//  Copyright © 2016 Bright Future. All rights reserved.
//

import Foundation

struct BaseStats {
    
    enum RangeType {
        case melee, ranged
    }
    
    var HPLow, HPHigh, weaponPowerLow, weaponPowerHigh, armorLow, armorHigh, shieldLow, shieldHigh, attackSpeedHigh, moveSpeed: Double
    var attackSpeedLow = 1.0
    
    init(HPLow: Double, HPHigh: Double, armorLow: Double = 20, armorHigh: Double = 86, shieldLow: Double = 20, shieldHigh: Double = 86, weaponPowerLow: Double, weaponPowerHigh: Double, attackSpeedHigh: Double, moveSpeed: Double) {
        self.HPLow = HPLow
        self.HPHigh = HPHigh
        self.armorLow = armorLow
        self.armorHigh = armorHigh
        self.shieldLow = shieldLow
        self.shieldHigh = shieldHigh
        self.weaponPowerLow = weaponPowerLow
        self.weaponPowerHigh = weaponPowerHigh
        self.attackSpeedHigh = attackSpeedHigh
        self.moveSpeed = moveSpeed
    }

    
    static let adagio = BaseStats(HPLow: 719, HPHigh: 1654, weaponPowerLow: 75, weaponPowerHigh: 117, attackSpeedHigh: 1.16, moveSpeed: 3.2)
    static let alpha = BaseStats(HPLow: 704, HPHigh: 1925, armorLow: 30, shieldLow: 30, weaponPowerLow: 83, weaponPowerHigh: 124, attackSpeedHigh: 1.22, moveSpeed: 3.4)
    static let ardan = BaseStats(HPLow: 801, HPHigh: 1615, armorLow: 30, shieldLow: 30, weaponPowerLow: 80, weaponPowerHigh: 140, attackSpeedHigh: 1.36, moveSpeed: 3.3)
    static let baron = BaseStats(HPLow: 814, HPHigh: 1672, armorLow: 30, shieldLow: 30, weaponPowerLow: 71, weaponPowerHigh: 108, attackSpeedHigh: 1.22, moveSpeed: 2.6)
    static let blackfeather = BaseStats(HPLow: 782, HPHigh: 1431, weaponPowerLow: 81, weaponPowerHigh: 160, attackSpeedHigh: 1.11, moveSpeed: 3.4)
    static let catherine = BaseStats(HPLow: 772, HPHigh: 1509, armorLow: 25, armorHigh: 80, shieldLow: 25, shieldHigh: 80, weaponPowerLow: 74, weaponPowerHigh: 141, attackSpeedHigh: 1.36, moveSpeed: 3.4)
    static let celeste = BaseStats(HPLow: 632, HPHigh: 1347, weaponPowerLow: 10, weaponPowerHigh: 10, attackSpeedHigh: 1.25, moveSpeed: 3.3)
    static let flicker = BaseStats(HPLow: 807, HPHigh: 1654, armorLow: 25, armorHigh: 85, shieldLow: 25, shieldHigh: 85, weaponPowerLow: 77, weaponPowerHigh: 155, attackSpeedHigh: 1.36, moveSpeed: 3.5)
    static let fortress = BaseStats(HPLow: 658, HPHigh: 1560, armorLow: 30, shieldLow: 30, weaponPowerLow: 73, weaponPowerHigh: 156, attackSpeedHigh: 1.44, moveSpeed: 3.4)
    static let glaive = BaseStats(HPLow: 814, HPHigh: 2046, armorLow: 30, shieldLow: 30, weaponPowerLow: 80, weaponPowerHigh: 153, attackSpeedHigh: 1.13, moveSpeed: 3.3)
    static let gwen = BaseStats(HPLow: 715, HPHigh: 1375, weaponPowerLow: 68, weaponPowerHigh: 132, attackSpeedHigh: 1.36, moveSpeed: 3.8)
    static let idris = BaseStats(HPLow: 755, HPHigh: 1600, weaponPowerLow: 77, weaponPowerHigh: 161, attackSpeedHigh: 1.36, moveSpeed: 3.2)
    static let joule = BaseStats(HPLow: 770, HPHigh: 1705, armorLow: 45, armorHigh: 150, shieldLow: 45, shieldHigh: 150, weaponPowerLow: 66, weaponPowerHigh: 148, attackSpeedHigh: 1.13, moveSpeed: 3.4)
    static let kestrel = BaseStats(HPLow: 615, HPHigh: 1407, weaponPowerLow: 64, weaponPowerHigh: 130, attackSpeedHigh: 1.36, moveSpeed: 3.1)
    static let koshka = BaseStats(HPLow: 792, HPHigh: 1595, weaponPowerLow: 79, weaponPowerHigh: 164, attackSpeedHigh: 1.09, moveSpeed: 3.25)
    static let krul = BaseStats(HPLow: 643, HPHigh: 1501, armorLow: 25, shieldLow: 25, weaponPowerLow: 68, weaponPowerHigh: 139, attackSpeedHigh: 1.36, moveSpeed: 3.4)
    static let lance = BaseStats(HPLow: 810, HPHigh: 2185, armorLow: 35, shieldLow: 45, weaponPowerLow: 96, weaponPowerHigh: 178, attackSpeedHigh: 1, moveSpeed: 3.3)
    static let lyra = BaseStats(HPLow: 695, HPHigh: 1366, armorLow: 30, armorHigh: 65, shieldLow: 30, shieldHigh: 65, weaponPowerLow: 10, weaponPowerHigh: 10, attackSpeedHigh: 1.36, moveSpeed: 3.3)
    static let ozo = BaseStats(HPLow: 780, HPHigh: 1825, weaponPowerLow: 80, weaponPowerHigh: 157, attackSpeedHigh: 1.36, moveSpeed: 3.3)
    static let petal = BaseStats(HPLow: 620, HPHigh: 1346, weaponPowerLow: 64, weaponPowerHigh: 134, attackSpeedHigh: 1.65, moveSpeed: 3.2)
    static let phinn = BaseStats(HPLow: 960, HPHigh: 1983, armorLow: 30, shieldLow: 30, weaponPowerLow: 95, weaponPowerHigh: 154, attackSpeedHigh: 1.13, moveSpeed: 2.8)
    static let reim = BaseStats(HPLow: 739, HPHigh: 1894, armorLow: 30, armorHigh: 52, shieldLow: 30, shieldHigh: 52, weaponPowerLow: 80, weaponPowerHigh: 153, attackSpeedHigh: 1.36, moveSpeed: 3.1)
    static let ringo = BaseStats(HPLow: 646, HPHigh: 1405, weaponPowerLow: 66, weaponPowerHigh: 130, attackSpeedHigh: 1.36, moveSpeed: 3.1)
    static let rona = BaseStats(HPLow: 815, HPHigh: 1893, weaponPowerLow: 88, weaponPowerHigh: 156, attackSpeedHigh: 1.13, moveSpeed: 3.3)
    static let samuel = BaseStats(HPLow: 687, HPHigh: 1479, weaponPowerLow: 78, weaponPowerHigh: 148, attackSpeedHigh: 1.3, moveSpeed: 3.2)
    static let saw = BaseStats(HPLow: 672, HPHigh: 1453, armorHigh: 88, shieldHigh: 88, weaponPowerLow: 50, weaponPowerHigh: 87, attackSpeedHigh: 3.11, moveSpeed: 3.1)
    static let skaarf = BaseStats(HPLow: 632, HPHigh: 1490, weaponPowerLow: 74, weaponPowerHigh: 148, attackSpeedHigh: 1.22, moveSpeed: 3.3)
    static let skye = BaseStats(HPLow: 650, HPHigh: 1563, weaponPowerLow: 72, weaponPowerHigh: 111, attackSpeedHigh: 1.36, moveSpeed: 3.1)
    static let taka = BaseStats(HPLow: 741, HPHigh: 1555, weaponPowerLow: 68, weaponPowerHigh: 125, attackSpeedHigh: 1.36, moveSpeed: 3.4)
    static let vox = BaseStats(HPLow: 695, HPHigh: 1465, weaponPowerLow: 72, weaponPowerHigh: 149, attackSpeedHigh: 1.51, moveSpeed: 3.3)

    
}
