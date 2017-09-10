//
//  Hero.swift
//  OverPowered
//
//  Created by Bright Future on 27/12/2016.
//  Copyright © 2016 Bright Future. All rights reserved.
//

import Foundation

class Hero: Namable {
    
    var HPLow, HPHigh, weaponPowerLow, weaponPowerHigh, armorLow, armorHigh, shieldLow, shieldHigh, attackSpeedHigh, critChance, moveSpeed, attackSpeedLow, weaponPowerModifier, attackSpeedModifier, defenseModifier, attackCooldown: Double
    
    init(name: String, HPLow: Double, HPHigh: Double, armorLow: Double = 20, armorHigh: Double = 86, shieldLow: Double = 20, shieldHigh: Double = 86, weaponPowerLow: Double, weaponPowerHigh: Double, attackSpeedLow: Double = 1, attackSpeedHigh: Double, critChance: Double = 0, moveSpeed: Double, weaponPowerModifier: Double = 1, attackSpeedModifier: Double = 1, defenseModifier: Double = 1, attackCooldown: Double = 1.1) {
        
        self.HPLow = HPLow
        self.HPHigh = HPHigh
        self.armorLow = armorLow
        self.armorHigh = armorHigh
        self.shieldLow = shieldLow
        self.shieldHigh = shieldHigh
        self.weaponPowerLow = weaponPowerLow
        self.weaponPowerHigh = weaponPowerHigh
        self.attackSpeedHigh = attackSpeedHigh
        self.critChance = critChance
        self.moveSpeed = moveSpeed
        self.attackSpeedLow = attackSpeedLow
        self.weaponPowerModifier = weaponPowerModifier
        self.attackSpeedModifier = attackSpeedModifier
        self.defenseModifier = defenseModifier
        self.attackCooldown = attackCooldown
        super.init(name: name)
    }
    
    
    static let adagio = Hero(name: "Adagio", HPLow: 719, HPHigh: 1654, weaponPowerLow: 75, weaponPowerHigh: 117, attackSpeedHigh: 1.16, moveSpeed: 3.2, attackCooldown: 1.05)
    static let alpha = Hero(name: "Alpha", HPLow: 704, HPHigh: 1925, armorLow: 30, shieldLow: 30, weaponPowerLow: 83, weaponPowerHigh: 124, attackSpeedHigh: 1.22, moveSpeed: 3.4,  attackCooldown: 1.05)
    static let ardan = Hero(name: "Ardan", HPLow: 801, HPHigh: 1615, armorLow: 30, shieldLow: 30, weaponPowerLow: 80, weaponPowerHigh: 140, attackSpeedHigh: 1.36, moveSpeed: 3.3, attackCooldown: 1.03)
    static let baptiste = Hero(name: "Baptiste", HPLow: 746, HPHigh: 1571, armorLow: 30, shieldLow: 30, weaponPowerLow: 78, weaponPowerHigh: 167, attackSpeedHigh: 1.36, moveSpeed: 3.4)
    static let baron = Hero(name: "Baron", HPLow: 814, HPHigh: 1672, armorLow: 30, shieldLow: 30, weaponPowerLow: 71, weaponPowerHigh: 108, attackSpeedHigh: 1.22, moveSpeed: 2.6, weaponPowerModifier: 1.2, attackSpeedModifier: 0.6, attackCooldown: 1.5)
    static let blackfeather = Hero(name: "Blackfeather", HPLow: 782, HPHigh: 1431, weaponPowerLow: 81, weaponPowerHigh: 160, attackSpeedHigh: 1.22, moveSpeed: 3.4)
    static let catherine = Hero(name: "Catherine", HPLow: 772, HPHigh: 1509, armorLow: 25, armorHigh: 80, shieldLow: 25, shieldHigh: 80, weaponPowerLow: 74, weaponPowerHigh: 141, attackSpeedHigh: 1.36, moveSpeed: 3.4)
    static let celeste = Hero(name: "Celeste", HPLow: 632, HPHigh: 1347, weaponPowerLow: 10, weaponPowerHigh: 10, attackSpeedHigh: 1.25, moveSpeed: 3.3)
    static let flicker = Hero(name: "Flicker", HPLow: 807, HPHigh: 1753, armorLow: 25, armorHigh: 85, shieldLow: 25, shieldHigh: 85, weaponPowerLow: 77, weaponPowerHigh: 155, attackSpeedHigh: 1.36, moveSpeed: 3.5)
    static let fortress = Hero(name: "Fortress", HPLow: 658, HPHigh: 1560, armorLow: 30, shieldLow: 30, weaponPowerLow: 73, weaponPowerHigh: 156, attackSpeedHigh: 1.44, moveSpeed: 3.4)
    static let glaive = Hero(name: "Glaive", HPLow: 814, HPHigh: 2046, armorLow: 30, shieldLow: 30, weaponPowerLow: 80, weaponPowerHigh: 153, attackSpeedHigh: 1.13, critChance: 0.25, moveSpeed: 3.3, attackCooldown: 1.03)
    static let grace = Hero(name: "Grace", HPLow: 748, HPHigh: 1452, weaponPowerLow: 73, weaponPowerHigh: 152, attackSpeedHigh: 1.36, moveSpeed: 3.5)
    static let grumpjaw = Hero(name: "Grumpjaw", HPLow: 765, HPHigh: 2107, armorLow: 30, shieldLow: 30, weaponPowerLow: 74, weaponPowerHigh: 158, attackSpeedHigh: 1.13, moveSpeed: 3.4)
    static let gwen = Hero(name: "Gwen", HPLow: 715, HPHigh: 1375, weaponPowerLow: 68, weaponPowerHigh: 132, attackSpeedHigh: 1.36, moveSpeed: 3.8)
    static let idris = Hero(name: "Idris", HPLow: 755, HPHigh: 1600, weaponPowerLow: 77, weaponPowerHigh: 161, attackSpeedHigh: 1.36, moveSpeed: 3.2)
    static let joule = Hero(name: "Joule", HPLow: 770, HPHigh: 1705, armorLow: 70, armorHigh: 234, shieldLow: 70, shieldHigh: 234, weaponPowerLow: 66, weaponPowerHigh: 148, attackSpeedHigh: 1.13, moveSpeed: 3.4, attackCooldown: 1.03)
    static let kestrel = Hero(name: "Kestrel", HPLow: 615, HPHigh: 1407, weaponPowerLow: 64, weaponPowerHigh: 130, attackSpeedHigh: 1.36, moveSpeed: 3.1)
    static let koshka = Hero(name: "Koshka", HPLow: 792, HPHigh: 1595, weaponPowerLow: 79, weaponPowerHigh: 164, attackSpeedHigh: 1.09, moveSpeed: 3.25)
    static let krul = Hero(name: "Krul", HPLow: 643, HPHigh: 1501, armorLow: 25, shieldLow: 25, weaponPowerLow: 77, weaponPowerHigh: 147, attackSpeedHigh: 1.36, moveSpeed: 3.4, attackCooldown: 1)
    static let lance = Hero(name: "Lance", HPLow: 810, HPHigh: 2185, armorLow: 35, shieldLow: 45, weaponPowerLow: 96, weaponPowerHigh: 178, attackSpeedHigh: 1, moveSpeed: 3.3, attackSpeedModifier: 0.5, attackCooldown: 1.4)
    static let lyra = Hero(name: "Lyra", HPLow: 695, HPHigh: 1366, armorLow: 30, armorHigh: 65, shieldLow: 30, shieldHigh: 65, weaponPowerLow: 10, weaponPowerHigh: 10, attackSpeedHigh: 1.36, moveSpeed: 3.3, attackCooldown: 1.3)
    static let ozo = Hero(name: "Ozo", HPLow: 780, HPHigh: 1825, weaponPowerLow: 80, weaponPowerHigh: 157, attackSpeedHigh: 1.36, moveSpeed: 3.3)
    static let petal = Hero(name: "Petal", HPLow: 620, HPHigh: 1346, weaponPowerLow: 64, weaponPowerHigh: 134, attackSpeedLow: 1, attackSpeedHigh: 1.36, moveSpeed: 3.2)
    static let phinn = Hero(name: "Phinn", HPLow: 960, HPHigh: 1983, armorLow: 30, shieldLow: 30, weaponPowerLow: 95, weaponPowerHigh: 154, attackSpeedHigh: 1.13, moveSpeed: 2.8, attackCooldown: 1.35)
    static let reim = Hero(name: "Reim", HPLow: 739, HPHigh: 1894, armorLow: 30, armorHigh: 52, shieldLow: 30, shieldHigh: 52, weaponPowerLow: 80, weaponPowerHigh: 153, attackSpeedHigh: 1.36, moveSpeed: 3.2)
    static let reza = Hero(name: "Reza", HPLow: 722, HPHigh: 1514, weaponPowerLow: 84, weaponPowerHigh: 154, attackSpeedHigh: 1.25, moveSpeed: 3.5)
    static let ringo = Hero(name: "Ringo", HPLow: 646, HPHigh: 1405, weaponPowerLow: 66, weaponPowerHigh: 130, attackSpeedHigh: 1.36, moveSpeed: 3.1)
    static let rona = Hero(name: "Rona", HPLow: 815, HPHigh: 1893, weaponPowerLow: 88, weaponPowerHigh: 156, attackSpeedHigh: 1.13, moveSpeed: 3.3, weaponPowerModifier: 0.85, attackCooldown: 0.79)
    static let samuel = Hero(name: "Samuel", HPLow: 687, HPHigh: 1479, weaponPowerLow: 78, weaponPowerHigh: 148, attackSpeedHigh: 1.3, moveSpeed: 3.2)
    static let saw = Hero(name: "Saw", HPLow: 672, HPHigh: 1453, weaponPowerLow: 50, weaponPowerHigh: 87, attackSpeedLow:  2.8, attackSpeedHigh: 3.27, moveSpeed: 3.1)
    static let skaarf = Hero(name: "Skaarf", HPLow: 632, HPHigh: 1490, weaponPowerLow: 80, weaponPowerHigh: 154, attackSpeedHigh: 1.22, moveSpeed: 3.3)
    static let skye = Hero(name: "Skye", HPLow: 650, HPHigh: 1563, weaponPowerLow: 72, weaponPowerHigh: 111, attackSpeedHigh: 1.36, moveSpeed: 3.1, attackCooldown: 1.09)
    static let taka = Hero(name: "Taka", HPLow: 741, HPHigh: 1555, weaponPowerLow: 68, weaponPowerHigh: 125, attackSpeedHigh: 1.36, moveSpeed: 3.4, attackCooldown: 1.39)
    static let vox = Hero(name: "Vox", HPLow: 695, HPHigh: 1465, weaponPowerLow: 72, weaponPowerHigh: 149, attackSpeedHigh: 1.35, moveSpeed: 3.3)
    
    static let all = [adagio, alpha, ardan, baptiste, baron, blackfeather, catherine, celeste, flicker, fortress, glaive, grace, grumpjaw, gwen, idris, joule, kestrel, koshka, krul, lance, lyra, ozo, petal, phinn, reim, ringo, rona, samuel, saw, skaarf, skye, taka, vox, reza]
    
}
