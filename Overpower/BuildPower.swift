//
//  BuildPower.swift
//  OverPowered
//
//  Created by Bright Future on 03/03/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class BuildPower {
    
    var build = [Item]()
    var infusion: Infusion?
    
    var weaponPower: Double {
        var x = 0.0
        if tensionBowBuffed {
            x += 180
        }
        if infusion != nil {
            x += infusion!.weaponPower
        }
        x += build.reduce(x, { $0 + $1.weaponPower })
        return x
    }
    var attackSpeed: Double {
        if infusion != nil {
            return build.reduce(0, { $0 + $1.attackSpeed }) + infusion!.attackSpeed
        }
        return build.reduce(0, { $0 + $1.attackSpeed })
    }
    var critChance: Double {
        return build.reduce(0, { $0 + $1.critChance })
    }
    var critDamage: Double {
        return build.reduce(0, { $0 + $1.critDamage })
    }
    var armorPierce: Double {
        return build.reduce(0, { $0 + $1.armorPierce })
    }
    var breakingPointStack: Int = 0 {
        didSet {
            let index = build.index(of: Item.breakingPoint)!
            build[index].weaponPower = 55 + 10 * Double(breakingPointStack)
        }
    }
    var tensionBowBuffed: Bool = false
    
    var crystalPower: Double {
        let clockworkMultiplier: Double = hasClockwork ? 1.3 : 1
        
        if infusion != nil {
            return (build.reduce(0, { $0 + $1.crystalPower }) + infusion!.crystalPower) * clockworkMultiplier
        }
        return build.reduce(0, { $0 + $1.crystalPower }) * clockworkMultiplier
    }
    var hasClockwork: Bool {
        return build.contains(Item.clockwork) ? true : false
    }
    var brokenMythStack: Int = 0
    var cooldownReduction: Double {
        if infusion != nil {
            return build.reduce(0, { $0 + $1.cooldownReduction }) + infusion!.cooldownReduction
        }
        return build.reduce(0, { $0 + $1.cooldownReduction })
    }
    var maxEnergy: Double {
        return build.reduce(0, { $0 + $1.maxEnergy })
    }
    var energyRecharge: Double {
        return build.reduce(0, { $0 + $1.energyRecharge })
    }
    var shieldPierce: Double {
        return build.reduce(0, { $0 + $1.shieldPierce })
    }
    
    var armor: Double {
        if infusion != nil {
            return build.reduce(0, { $0 + $1.armor }) + infusion!.armor
        }
        return build.reduce(0, { $0 + $1.armor })
    }
    var shield: Double {
        if infusion != nil {
            return build.reduce(0, { $0 + $1.shield }) + infusion!.shield
        }
        return build.reduce(0, { $0 + $1.shield })
    }
    var health: Double {
        return build.reduce(0, { $0 + $1.health })
    }
    var moveSpeed: Double {
        return build.map( { $0.moveSpeed } ).max() ?? 0
    }
    
    var cost: Double {
        if infusion != nil {
            return build.reduce(0, { $0 + $1.price }) + infusion!.price
        }
        return build.reduce(0, { $0 + $1.price })
    }
    
}
