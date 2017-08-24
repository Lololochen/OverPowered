//
//  Item.swift
//  OverPowered
//
//  Created by Bright Future on 03/03/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class Item: Namable {
    
    var price, weaponPower, attackSpeed, critChance, critDamage, armorPierce, crystalPower, cooldownReduction, shieldPierce, armor, shield, health, maxEnergy, energyRecharge, moveSpeed: Double
    
    init(name: String, price: Double, weaponPower: Double = 0, attackSpeed: Double = 0, critChance: Double = 0, critDamage: Double = 0, armorPierce: Double = 0, crystalPower: Double = 0, cooldownReduction: Double = 0, shieldPierce: Double = 0, armor: Double = 0, shield: Double = 0, health: Double = 0, maxEnergy: Double = 0, energyRecharge: Double = 0, moveSpeed: Double = 0){
        
        self.price = price
        self.weaponPower = weaponPower
        self.attackSpeed = attackSpeed
        self.critChance = critChance
        self.critDamage = critDamage
        self.armorPierce = armorPierce
        self.crystalPower = crystalPower
        self.cooldownReduction = cooldownReduction
        self.shieldPierce = shieldPierce
        self.armor = armor
        self.shield = shield
        self.health = health
        self.maxEnergy = maxEnergy
        self.energyRecharge = energyRecharge
        self.moveSpeed = moveSpeed
        super.init(name: name)
    }
    // Red items
    static let weaponBlade = Item(name: "Weapon Blade", price: 300, weaponPower: 15)
    static let swiftShooter = Item(name: "Swift Shooter", price: 300, attackSpeed: 0.1)
    static let bookOfEulogies = Item(name: "Book of Eulogies", price: 300, weaponPower: 5)
    static let minionsFoot = Item(name: "Minions Foot", price: 300, critChance: 0.1, critDamage: 0.1)
    static let heavySteel = Item(name: "Heavy Steel", price: 1150, weaponPower: 55)
    static let sixSins = Item(name: "Six Sins", price: 650, weaponPower: 30)
    static let barbedNeedle = Item(name: "Barbed Needle", price: 800, weaponPower: 12)
    static let piercingSpear = Item(name: "Piercing Spear", price: 900, weaponPower: 15, armorPierce: 0.08)
    static let blazingSalvo = Item(name: "Blazing Salvo", price: 700, attackSpeed: 0.2)
    static let luckyStrike = Item(name: "Lucky Strike", price: 900, critChance: 0.2, critDamage: 0.15)
    static let sorrowBlade = Item(name: "Sorrow Blade", price: 3100, weaponPower: 150)
    static let serpentMask = Item(name: "Serpent Mast", price: 2800, weaponPower: 85)
    static let poisonedShiv = Item(name: "Poisoned Shiv", price: 2250, weaponPower: 35, attackSpeed: 0.3)
    static let breakingPoint = Item(name: "Breaking Point", price: 2600, weaponPower: 55, attackSpeed: 0.2)
    static let tensionBow = Item(name: "Tension Bow", price: 2150, weaponPower: 45, armorPierce: 0.12)
    static let bonesaw = Item(name: "Bonesaw", price: 2700, weaponPower: 15, attackSpeed: 0.25, armorPierce: 0.08)
    static let tornadoTrigger = Item(name: "Tornado Trigger", price: 2800, attackSpeed: 0.4, critChance:0.35, critDamage: 0.2)
    static let tyrantsMonocle = Item(name: "Tyrants Monocle", price: 2750, weaponPower: 60, critChance: 0.35, critDamage: 0.15)
    // Blue items
    static let crystalBit = Item(name: "Crystal Bit", price: 300, crystalPower: 15)
    static let hourglass = Item(name: "Hourglass", price: 300, cooldownReduction: 0.15, energyRecharge: 1.5)
    static let energyBattery = Item(name: "Energy Battery", price: 300, maxEnergy: 150, energyRecharge: 2.5)
    static let heavyPrism = Item(name: "Heavy Prism", price: 1050, crystalPower: 50, maxEnergy: 150, energyRecharge: 2.5)
    static let eclipsePrism = Item(name: "Eclipse Prism", price: 650, crystalPower: 35)
    static let piercingShard = Item(name: "Piercing Shard", price: 900, crystalPower: 20, shieldPierce: 0.08)
    static let voidBattery = Item(name: "Void Battery", price: 700, maxEnergy: 250, energyRecharge: 4)
    static let chronograph = Item(name: "Chronograph", price: 800, cooldownReduction: 0.25, energyRecharge: 2.5)
    static let shatterglass = Item(name: "Shatterglass", price: 3000, crystalPower: 150)
    static let brokenMyth = Item(name: "Broken Myth", price: 3100, crystalPower: 70, shieldPierce: 0.1)
    static let frostburn = Item(name: "Frostburn", price: 2600, crystalPower: 100)
    static let eveOfHarvest = Item(name: "Eve of Harvest", price: 2600, crystalPower: 55)
    static let echo = Item(name: "Echo", price: 2200, maxEnergy: 300, energyRecharge: 4)
    static let clockwork = Item(name: "Clockwork", price: 2250, cooldownReduction: 0.4, energyRecharge: 7.5)
    static let aftershock = Item(name: "Aftershock", price: 2400, crystalPower: 35, cooldownReduction: 0.25, energyRecharge: 2.5)
    static let alternatingCurrent = Item(name: "Alternating Current", price: 2800, attackSpeed: 0.35, crystalPower: 60)
    static let stormcrown = Item(name: "Stormcrown", price: 2200, cooldownReduction: 0.3, energyRecharge: 4)
    // Yellow items
    static let lightArmor = Item(name: "Light Armor", price: 250, armor: 40, shield: 10)
    static let coatOfPlates = Item(name: "Coat Of Plates", price: 800, armor: 75, shield: 30)
    static let metalJacket = Item(name: "Metal Jacket", price: 2100, armor: 170, shield: 35)
    static let atlasPauldron = Item(name: "Atlas Pauldron", price: 1900, armor: 85, shield: 35)
    static let lightShield = Item(name: "Light Armor", price: 250, armor: 10, shield: 40)
    static let kineticShield = Item(name: "Kinetic Shield", price: 800, armor: 30, shield: 75)
    static let fountainOfRenewal = Item(name: "Fountain Of Renewal", price: 2300, armor: 30, shield: 75, health: 200)
    static let aegis = Item(name: "Aegis", price: 2250, armor: 30, shield: 125, health: 200)
    static let oakheart = Item(name: "Oakheart", price: 300, health: 200)
    static let dragonheart = Item(name: "Dragonheart", price: 650, health: 400)
    static let shiversteel = Item(name: "Shiversteel", price: 1450, health: 500)
    static let lifespring = Item(name: "Lifespring", price: 800, health: 200)
    static let reflexBlock = Item(name: "Reflex Block", price: 700, health: 200)
    static let crucible = Item(name: "Crucible", price: 1850, health: 600)
    // Utilities
    static let sprintBoots = Item(name: "Sprint Boots", price: 300, moveSpeed: 0.4)
    static let travelBoots = Item(name: "Travel Boots", price: 1000, health: 100, moveSpeed: 0.4)
    static let journeyBoots = Item(name: "Journey Boots", price: 1900, health: 250, moveSpeed: 0.6)
    static let halcyonChargers = Item(name: "Halcyon Chargers", price: 2300, health: 200, maxEnergy: 250, energyRecharge: 4, moveSpeed: 0.5)
    static let warTreads = Item(name: "War Treads", price: 2500, health: 500, moveSpeed: 0.4)
    static let flareGun = Item(name: "Flare Gun", price: 600, health: 250)
    static let contraption = Item(name: "Contraption", price: 2100, cooldownReduction: 0.4, health: 350, energyRecharge: 3)
    static let stormguardBanner = Item(name: "Stormguard Banner", price: 850, health: 200)
    static let slumberingHusk = Item(name: "Slumbering Hust", price: 1700, health: 500)
    static let nullwaveGauntlet = Item(name: "Nullwave Gauntlet", price: 2400, cooldownReduction: 0.25, health: 400, energyRecharge: 4)

    
    static let weaponItems = [weaponBlade, swiftShooter, bookOfEulogies, minionsFoot, heavySteel, sixSins, barbedNeedle, piercingSpear, blazingSalvo, luckyStrike, sorrowBlade, serpentMask, tensionBow, bonesaw, tornadoTrigger, tyrantsMonocle, poisonedShiv, breakingPoint]
    
    static let crystalItems = [crystalBit, energyBattery, hourglass, heavyPrism, eclipsePrism, voidBattery, piercingShard, chronograph, shatterglass, brokenMyth, frostburn, eveOfHarvest, clockwork, aftershock, alternatingCurrent]
    
    static let defenseItems = [lightArmor, coatOfPlates, atlasPauldron, metalJacket, lightShield, kineticShield, reflexBlock, aegis, oakheart, dragonheart, slumberingHusk, lifespring, fountainOfRenewal, crucible, stormguardBanner, stormcrown, flareGun, contraption, shiversteel, nullwaveGauntlet, travelBoots, journeyBoots, halcyonChargers, warTreads]
    
    static var all: [Item] {
        return weaponItems + crystalItems + defenseItems
    }
}


