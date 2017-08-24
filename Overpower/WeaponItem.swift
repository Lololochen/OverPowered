//
//  WeaponItem.swift
//  Overpower
//
//  Created by Bright Future on 08/09/2016.
//  Copyright © 2016 Bright Future. All rights reserved.
//

import UIKit

class WeaponItem: Items {
    
    var weaponPower, attackSpeed, criticalChance, criticalDamage, armorPierce: Double
        
    init(name: String, price: Int, weaponPower: Double = 0, attackSpeed: Double = 0, criticalChance: Double = 0, criticalDamage: Double = 0, armorPierce: Double = 0, image: UIImage){
        
        self.weaponPower = weaponPower
        self.attackSpeed = attackSpeed
        self.criticalChance = criticalChance
        self.criticalDamage = criticalDamage
        self.armorPierce = armorPierce
        super.init(name: name, price: price, image: image)
    }
    
    // Tier 1 items
    static let weaponBlade = WeaponItem(name: "Weapon Blade", price: 300, weaponPower: 15, image: #imageLiteral(resourceName: "weapon-blade"))
    static let swiftShooter = WeaponItem(name: "Swift Shooter", price: 300, attackSpeed: 0.2, image: #imageLiteral(resourceName: "swift-shooter"))
    static let minionsFoot = WeaponItem(name: "Minions Foot", price: 300, criticalChance: 0.1, criticalDamage: 0.1, image: #imageLiteral(resourceName: "minions-foot"))
    // Tier 2 items
    static let heavySteel = WeaponItem(name: "Heavy Steel", price: 1150, weaponPower: 55, image: #imageLiteral(resourceName: "heavy-steel"))
    static let sixSins = WeaponItem(name: "Six Sins", price: 650, weaponPower: 30, image: #imageLiteral(resourceName: "six-sins"))
    static let piercingSpear = WeaponItem(name: "Piercing Spear", price: 900, weaponPower: 15, armorPierce: 0.08, image: #imageLiteral(resourceName: "piercing-spear"))
    static let blazingSalvo = WeaponItem(name: "Blazing Salvo", price: 700, attackSpeed: 0.35, image: #imageLiteral(resourceName: "blazing-salvo"))
    static let luckyStrike = WeaponItem(name: "Lucky Strike", price: 900, criticalChance: 0.2, criticalDamage: 0.12, image: #imageLiteral(resourceName: "lucky-strike"))
    // Tier 3 items
    static let sorrowBlade = WeaponItem(name: "Sorrow Blade", price: 3100, weaponPower: 150, image: #imageLiteral(resourceName: "sorrowblade"))
    static let serpentMask = WeaponItem(name: "Serpent Mast", price: 2800, weaponPower: 85, image: #imageLiteral(resourceName: "serpent-mask"))
    static let breakingPoint = WeaponItem(name: "Breaking Point", price: 2500, weaponPower: 55, attackSpeed: 0.35, image: #imageLiteral(resourceName: "breaking-point"))
    static let tensionBow = WeaponItem(name: "Tension Bow", price: 2150, weaponPower: 45, armorPierce: 0.1, image: #imageLiteral(resourceName: "tension-bow"))
    static let bonesaw = WeaponItem(name: "Bonesaw", price: 2700, weaponPower: 15, attackSpeed: 0.5, image: #imageLiteral(resourceName: "bonesaw"))
    static let tornadoTrigger = WeaponItem(name: "Tornado Trigger", price: 2600, attackSpeed: 0.75, criticalChance:0.2, criticalDamage: 0.2, image: #imageLiteral(resourceName: "tornado-trigger"))
    static let tyrantsMonocle = WeaponItem(name: "Tyrants Monocle", price: 2750, weaponPower: 50, criticalChance: 0.4, criticalDamage: 0.2, image: #imageLiteral(resourceName: "tyrants-monocle"))
    static let weaponInfusionLv12 = WeaponItem(name: "Weapon Infusion Lv12", price: 500, weaponPower: 60, attackSpeed: 0.24, image: #imageLiteral(resourceName: "Lv12-weapon-infusion"))
    static let poisonedShiv = WeaponItem(name: "Poisoned Shiv", price: 2250, weaponPower: 25, attackSpeed: 0.4, image: #imageLiteral(resourceName: "poisoned-shiv"))
    
    static let weaponItems = [weaponBlade, swiftShooter, minionsFoot,
                              heavySteel, sixSins, piercingSpear, blazingSalvo,
                              luckyStrike, sorrowBlade, serpentMask,
                              tensionBow, bonesaw, tornadoTrigger, tyrantsMonocle, poisonedShiv, breakingPoint, weaponInfusionLv12]
    static let t3WeaponItems = [sorrowBlade, serpentMask,
                                tensionBow, bonesaw, tornadoTrigger, tyrantsMonocle, weaponInfusionLv12, poisonedShiv, breakingPoint]
}
