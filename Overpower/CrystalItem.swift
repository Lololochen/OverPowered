//
//  CrystalItem.swift
//  Overpower
//
//  Created by Bright Future on 08/09/2016.
//  Copyright © 2016 Bright Future. All rights reserved.
//

import UIKit

class CrystalItem: Items {
    
    var crystalPower, cooldownReduction, shieldPierce: Double
    
    init(name: String, price: Int, crystalPower: Double = 0, cooldownReduction: Double = 0, shieldPierce: Double = 0, image: UIImage){
        
        self.crystalPower = crystalPower
        self.cooldownReduction = cooldownReduction
        self.shieldPierce = shieldPierce
        super.init(name: name, price: price, image: image)
    }
    
    static let crystalBit = CrystalItem(name: "Crystal Bit", price: 300, crystalPower: 15, image: #imageLiteral(resourceName: "crystal-bit"))
    static let hourglass = CrystalItem(name: "Hourglass", price: 300, cooldownReduction: 0.15, image: #imageLiteral(resourceName: "hourglass"))
    static let heavyPrism = CrystalItem(name: "Heavy Prism", price: 1050, crystalPower: 50, image: #imageLiteral(resourceName: "heavy-prism"))
    static let eclipsePrism = CrystalItem(name: "Eclipse Prism", price: 650, crystalPower: 35, image: #imageLiteral(resourceName: "eclipse-prism"))
    static let piercingShard = CrystalItem(name: "Piercing Shard", price: 900, crystalPower: 20, shieldPierce: 0.08, image: #imageLiteral(resourceName: "piercing-shard"))
    static let chronograph = CrystalItem(name: "Chronograph", price: 800, cooldownReduction: 0.25, image: #imageLiteral(resourceName: "chronograph"))
    static let shatterglass = CrystalItem(name: "Shatterglass", price: 3000, crystalPower: 150, image: #imageLiteral(resourceName: "shatterglass"))
    static let brokenMyth = CrystalItem(name: "Broken Myth", price: 3100, crystalPower: 70, shieldPierce: 0.1, image: #imageLiteral(resourceName: "broken-myth"))
    static let frostburn = CrystalItem(name: "Frostburn", price: 2600, crystalPower: 100, image: #imageLiteral(resourceName: "frostburn"))
    static let eveOfHarvest = CrystalItem(name: "Eve of Harvest", price: 2600, crystalPower: 55, image: #imageLiteral(resourceName: "eve-of-harvest"))
    static let clockwork = CrystalItem(name: "Clockwork", price: 2500, cooldownReduction: 0.4, image: #imageLiteral(resourceName: "clockwork"))
    static let aftershock = CrystalItem(name: "Aftershock", price: 2400, crystalPower: 35, cooldownReduction: 0.25, image: #imageLiteral(resourceName: "aftershock"))
    static let alternatingCurrent = CrystalItem(name: "Alternating Current", price: 2800, crystalPower: 60, image: #imageLiteral(resourceName: "alternating-current"))
    static let stormcrown = CrystalItem(name: "Stormcrown", price: 2200, cooldownReduction: 0.3, image: #imageLiteral(resourceName: "stormcrown"))
    static let contraption = CrystalItem(name: "Contraption", price: 2100, cooldownReduction: 0.4, image: #imageLiteral(resourceName: "contraption"))
    static let crystalInfusionLv12 = CrystalItem(name: "Crystal Infusion Lv12", price: 500, crystalPower: 60, cooldownReduction: 0.36, image: #imageLiteral(resourceName: "Lv12 crystal infusion"))
    static let crystalInfusionLv11 = CrystalItem(name: "Crystal Infusion Lv11", price: 500, crystalPower: 56, cooldownReduction: 0.34, image: #imageLiteral(resourceName: "Lv11-crystal-infusion"))
    static let crystalInfusionLv9 = CrystalItem(name: "Crystal Infusion Lv9", price: 500, crystalPower: 49, cooldownReduction: 0.29, image: #imageLiteral(resourceName: "Lv9-crystal-infusion"))
    static let nullwaveGauntlet = CrystalItem(name: "Nullwave Gauntlet", price: 2400, cooldownReduction: 0.25, image: #imageLiteral(resourceName: "nullwave-gauntlet"))
    static let halcyonChargers = CrystalItem(name: "Halcyon Chargers", price: 2300, cooldownReduction: 0.15, image: #imageLiteral(resourceName: "halcyon-chargers"))

    static let coreCrystalItems = [shatterglass, brokenMyth, clockwork]
    static let t3CrystalItems = [shatterglass, brokenMyth, clockwork, aftershock, alternatingCurrent, stormcrown, crystalInfusionLv12]
    static let CDRItems = [hourglass, chronograph, aftershock, clockwork, halcyonChargers, nullwaveGauntlet, contraption, stormcrown, crystalInfusionLv9, crystalInfusionLv11, crystalInfusionLv12]
}
