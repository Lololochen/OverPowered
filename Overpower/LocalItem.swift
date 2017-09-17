//
//  Item.swift
//  OverPowered
//
//  Created by Bright Future on 03/03/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import UIKit

class LocalItem: Selectable {
    
    var name: String
    var image: UIImage
    
    init(name: String, image: UIImage) {
        self.name = name
        self.image = image
    }
    
    static let emptyItem = LocalItem(name: "Empty", image: #imageLiteral(resourceName: "EmptyItem"))
    static let weaponBlade = LocalItem(name: "Weapon Blade", image: #imageLiteral(resourceName: "weapon-blade"))
    static let swiftShooter = LocalItem(name: "Swift Shooter", image: #imageLiteral(resourceName: "swift-shooter"))
    static let bookOfEulogies = LocalItem(name: "Book of Eulogies", image: #imageLiteral(resourceName: "book-of-eulogies"))
    static let minionsFoot = LocalItem(name: "Minions Foot", image: #imageLiteral(resourceName: "minions-foot"))
    static let heavySteel = LocalItem(name: "Heavy Steel", image: #imageLiteral(resourceName: "heavy-steel"))
    static let sixSins = LocalItem(name: "Six Sins", image: #imageLiteral(resourceName: "six-sins"))
    static let barbedNeedle = LocalItem(name: "Barbed Needle", image: #imageLiteral(resourceName: "barbed-needle"))
    static let piercingSpear = LocalItem(name: "Piercing Spear", image: #imageLiteral(resourceName: "piercing-spear"))
    static let blazingSalvo = LocalItem(name: "Blazing Salvo", image: #imageLiteral(resourceName: "blazing-salvo"))
    static let luckyStrike = LocalItem(name: "Lucky Strike", image: #imageLiteral(resourceName: "lucky-strike"))
    static let sorrowBlade = LocalItem(name: "Sorrow Blade", image: #imageLiteral(resourceName: "sorrowblade"))
    static let serpentMask = LocalItem(name: "Serpent Mast", image: #imageLiteral(resourceName: "serpent-mask"))
    static let spellsword = LocalItem(name: "Spellsword", image: #imageLiteral(resourceName: "spellsword"))
    static let breakingPoint = LocalItem(name: "Breaking Point", image: #imageLiteral(resourceName: "breaking-point"))
    static let tensionBow = LocalItem(name: "Tension Bow", image: #imageLiteral(resourceName: "tension-bow"))
    static let bonesaw = LocalItem(name: "Bonesaw", image: #imageLiteral(resourceName: "bonesaw"))
    static let tornadoTrigger = LocalItem(name: "Tornado Trigger", image: #imageLiteral(resourceName: "tornado-trigger"))
    static let tyrantsMonocle = LocalItem(name: "Tyrants Monocle", image: #imageLiteral(resourceName: "tyrants-monocle"))
    static let weaponInfusionLv12 = LocalItem(name: "Weapon Infusion", image: #imageLiteral(resourceName: "weapon-infusion"))
    static let poisonedShiv = LocalItem(name: "Poisoned Shiv", image: #imageLiteral(resourceName: "poisoned-shiv"))
    static let crystalBit = LocalItem(name: "Crystal Bit", image: #imageLiteral(resourceName: "crystal-bit"))
    static let hourglass = LocalItem(name: "Hourglass", image: #imageLiteral(resourceName: "hourglass"))
    static let energyBattery = LocalItem(name: "Energy Battery", image: #imageLiteral(resourceName: "energy-battery"))
    static let heavyPrism = LocalItem(name: "Heavy Prism", image: #imageLiteral(resourceName: "heavy-prism"))
    static let eclipsePrism = LocalItem(name: "Eclipse Prism", image: #imageLiteral(resourceName: "eclipse-prism"))
    static let piercingShard = LocalItem(name: "Piercing Shard", image: #imageLiteral(resourceName: "piercing-shard"))
    static let voidBattery = LocalItem(name: "Void Battery", image: #imageLiteral(resourceName: "void-battery"))
    static let chronograph = LocalItem(name: "Chronograph", image: #imageLiteral(resourceName: "chronograph"))
    static let shatterglass = LocalItem(name: "Shatterglass", image: #imageLiteral(resourceName: "shatterglass"))
    static let brokenMyth = LocalItem(name: "Broken Myth", image: #imageLiteral(resourceName: "broken-myth"))
    static let frostburn = LocalItem(name: "Frostburn", image: #imageLiteral(resourceName: "frostburn"))
    static let eveOfHarvest = LocalItem(name: "Eve of Harvest", image: #imageLiteral(resourceName: "eve-of-harvest"))
    static let echo = LocalItem(name: "Echo", image: #imageLiteral(resourceName: "echo"))
    static let clockwork = LocalItem(name: "Clockwork", image: #imageLiteral(resourceName: "clockwork"))
    static let aftershock = LocalItem(name: "Aftershock", image: #imageLiteral(resourceName: "aftershock"))
    static let alternatingCurrent = LocalItem(name: "Alternating Current", image: #imageLiteral(resourceName: "alternating-current"))
    static let stormcrown = LocalItem(name: "Stormcrown", image: #imageLiteral(resourceName: "stormcrown"))
    static let crystalInfusionLv12 = LocalItem(name: "Crystal Infusion", image: #imageLiteral(resourceName: "crystal-infusion"))
    static let lightArmor = LocalItem(name: "Light Armor", image: #imageLiteral(resourceName: "light-armor"))
    static let coatOfPlates = LocalItem(name: "Coat Of Plates", image: #imageLiteral(resourceName: "coat-of-plates"))
    static let metalJacket = LocalItem(name: "Metal Jacket", image: #imageLiteral(resourceName: "metal-jacket"))
    static let atlasPauldron = LocalItem(name: "Atlas Pauldron", image: #imageLiteral(resourceName: "atlas-pauldron"))
    static let lightShield = LocalItem(name: "Light Armor", image: #imageLiteral(resourceName: "light-shield"))
    static let kineticShield = LocalItem(name: "Kinetic Shield", image: #imageLiteral(resourceName: "kinetic-shield"))
    static let fountainOfRenewal = LocalItem(name: "Fountain Of Renewal", image: #imageLiteral(resourceName: "fountain-of-renewal"))
    static let aegis = LocalItem(name: "Aegis", image: #imageLiteral(resourceName: "aegis"))
    static let oakheart = LocalItem(name: "Oakheart", image: #imageLiteral(resourceName: "oakheart"))
    static let dragonheart = LocalItem(name: "Dragonheart", image: #imageLiteral(resourceName: "dragonheart"))
    static let shiversteel = LocalItem(name: "Shiversteel", image: #imageLiteral(resourceName: "shiversteel"))
    static let lifespring = LocalItem(name: "Lifespring", image: #imageLiteral(resourceName: "lifespring"))
    static let reflexBlock = LocalItem(name: "Reflex Block", image: #imageLiteral(resourceName: "reflex-block"))
    static let crucible = LocalItem(name: "Crucible", image: #imageLiteral(resourceName: "crucible"))
    static let travelBoots = LocalItem(name: "Travel Boots", image: #imageLiteral(resourceName: "travel-boots"))
    static let journeyBoots = LocalItem(name: "Journey Boots", image: #imageLiteral(resourceName: "journey-boots"))
    static let halcyonChargers = LocalItem(name: "Halcyon Chargers", image: #imageLiteral(resourceName: "halcyon-chargers"))
    static let warTreads = LocalItem(name: "War Treads", image: #imageLiteral(resourceName: "war-treads"))
    static let flareGun = LocalItem(name: "Flare Gun", image: #imageLiteral(resourceName: "flare-gun"))
    static let contraption = LocalItem(name: "Contraption", image: #imageLiteral(resourceName: "contraption"))
    static let stormguardBanner = LocalItem(name: "Stormguard Banner", image: #imageLiteral(resourceName: "stormguard-banner"))
    static let slumberingHusk = LocalItem(name: "Slumbering Hust", image: #imageLiteral(resourceName: "slumbering-husk"))
    static let nullwaveGauntlet = LocalItem(name: "Nullwave Gauntlet", image: #imageLiteral(resourceName: "nullwave-gauntlet"))

    
    static let weaponItems = [weaponBlade, swiftShooter, bookOfEulogies, minionsFoot, heavySteel, sixSins, barbedNeedle, piercingSpear, blazingSalvo, luckyStrike, sorrowBlade, serpentMask, spellsword, tensionBow, bonesaw, tornadoTrigger, tyrantsMonocle, poisonedShiv, breakingPoint, weaponInfusionLv12]
    
    static let crystalItems = [crystalBit, energyBattery, hourglass, heavyPrism, eclipsePrism, voidBattery, piercingShard, chronograph, shatterglass, brokenMyth, frostburn, eveOfHarvest, clockwork, aftershock, alternatingCurrent, crystalInfusionLv12]
    
    static let defenseItems = [lightArmor, coatOfPlates, atlasPauldron, metalJacket, lightShield, kineticShield, reflexBlock, aegis, oakheart, dragonheart, slumberingHusk, lifespring, fountainOfRenewal, crucible, stormguardBanner, stormcrown, flareGun, contraption, shiversteel, nullwaveGauntlet, travelBoots, journeyBoots, halcyonChargers, warTreads]
    
    static var allItems: [LocalItem] {
        return weaponItems + crystalItems + defenseItems
    }
}
