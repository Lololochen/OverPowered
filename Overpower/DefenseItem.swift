//
//  DefenseItem.swift
//  Overpower
//
//  Created by Bright Future on 08/09/2016.
//  Copyright © 2016 Bright Future. All rights reserved.
//

import UIKit

class DefenseItem: Items {
    
    var armor, shield, HP: Double
        
    init(name: String, price: Int, armor: Double = 0, shield: Double = 0, HP: Double = 0, image: UIImage) {
        
        self.armor = armor
        self.shield = shield
        self.HP = HP
        super.init(name: name, price: price, image: image)
    }
    
    static let lightArmor = DefenseItem(name: "Light Armor", price: 250, armor: 40, shield: 20, image: #imageLiteral(resourceName: "light-armor"))
    static let coatOfPlates = DefenseItem(name: "Coat Of Plates", price: 800, armor: 75, shield: 30, image: #imageLiteral(resourceName: "coat-of-plates"))
    static let metalJacket = DefenseItem(name: "Metal Jacket", price: 2100, armor: 170, shield: 35, image: #imageLiteral(resourceName: "metal-jacket"))
    static let atlasPauldron = DefenseItem(name: "Atlas Pauldron", price: 1900, armor: 85, shield: 35, image: #imageLiteral(resourceName: "atlas-pauldron"))
    static let lightShield = DefenseItem(name: "Light Armor", price: 250, armor: 20, shield: 40, image: #imageLiteral(resourceName: "light-shield"))
    static let kineticShield = DefenseItem(name: "Kinetic Shield", price: 800, armor: 30, shield: 75, image: #imageLiteral(resourceName: "kinetic-shield"))
    static let fountainOfRenewal = DefenseItem(name: "Fountain Of Renewal", price: 2300, armor: 30, shield: 75, HP: 200, image: #imageLiteral(resourceName: "fountain-of-renewal"))
    static let aegis = DefenseItem(name: "Aegis", price: 2250, armor: 30, shield: 125, HP: 200, image: #imageLiteral(resourceName: "aegis"))
    static let oakheart = DefenseItem(name: "Oakheart", price: 300, HP: 200, image: #imageLiteral(resourceName: "oakheart"))
    static let dragonheart = DefenseItem(name: "Dragonheart", price: 650, HP: 400, image: #imageLiteral(resourceName: "dragonheart"))
    static let shiversteel = DefenseItem(name: "Shiversteel", price: 1450, HP: 500, image: #imageLiteral(resourceName: "shiversteel"))
    static let lifespring = DefenseItem(name: "Lifespring", price: 800, HP: 200, image: #imageLiteral(resourceName: "lifespring"))
    static let reflexBlock = DefenseItem(name: "Reflex Block", price: 700, HP: 200, image: #imageLiteral(resourceName: "reflex-block"))
    static let crucible = DefenseItem(name: "Crucible", price: 1850, HP: 600, image: #imageLiteral(resourceName: "crucible"))
    static let travelBoots = DefenseItem(name: "Travel Boots", price: 1000, HP: 100, image: #imageLiteral(resourceName: "travel-boots"))
    static let journeyBoots = DefenseItem(name: "Journey Boots", price: 1900, HP: 250, image: #imageLiteral(resourceName: "journey-boots"))
    static let halcyonChargers = DefenseItem(name: "Halcyon Chargers", price: 2300, HP: 200, image: #imageLiteral(resourceName: "halcyon-chargers"))
    static let warTreads = DefenseItem(name: "War Treads", price: 2500, HP: 500, image: #imageLiteral(resourceName: "war-treads"))
    static let flareGun = DefenseItem(name: "Flare Gun", price: 600, HP: 250, image: #imageLiteral(resourceName: "flare-gun"))
    static let contraption = DefenseItem(name: "Contraption", price: 2100, HP: 350, image: #imageLiteral(resourceName: "contraption"))
    static let stormguardBanner = DefenseItem(name: "Stormguard Banner", price: 850, HP: 200,image: #imageLiteral(resourceName: "stormguard-banner"))
    static let slumberingHusk = DefenseItem(name: "Slumbering Hust", price: 1600, HP: 400, image: #imageLiteral(resourceName: "slumbering-husk"))
    static let nullwaveGauntlet = DefenseItem(name: "Nullwave Gauntlet", price: 2400, HP: 400, image: #imageLiteral(resourceName: "nullwave-gauntlet"))
    
    static let defenseItems = [lightArmor, coatOfPlates, atlasPauldron, metalJacket, lightShield, kineticShield, aegis, oakheart, dragonheart, shiversteel, lifespring, reflexBlock, crucible, travelBoots, journeyBoots, halcyonChargers, warTreads, slumberingHusk]
}
