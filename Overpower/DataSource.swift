//
//  DataSource.swift
//  OverPowered
//
//  Created by Bright Future on 03/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

struct DataSource {
    
    var attacker = PlayerFightPower()
    var defender = PlayerFightPower()

    var attackerLevel: Int = 1 {
        didSet {
            attacker.heroPower.level = attackerLevel
            if let infusion = attacker.buildPower.infusion {
                infusion.level = attacker.heroPower.level!
            }
        }
    }
    var defenderLevel: Int = 1 {
        didSet {
            defender.heroPower.level = defenderLevel
            if let infusion = defender.buildPower.infusion {
                infusion.level = defender.heroPower.level!
            }
        }
    }
}

protocol Fightable { }

extension PlayerFightPower: Fightable { }
