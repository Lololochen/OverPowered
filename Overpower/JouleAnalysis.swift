//
//  JouleAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class JouleAnalysis: AbilityAnalysis {
    
    var calculator: Joule {
        return Joule(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())

        result.append(("A ability damage".localizedString(), calculator.aAbilityDamage.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability damage with pierce".localizedString(), calculator.bAbilityDamageWithPierce.string()))
        
        result.append(("Damage without pierce".localizedString(), calculator.bAbilityDamageWithoutPierce.string()))
        
        result.append(("B ability DPS with basic attacks".lowercased(), calculator.bAbilityDpsWithBasicAttacks.string()))
        
        result.append(("Ult DPS".localizedString(), calculator.ultDps.string()))
        
        result.append(("Total damage".localizedString(), calculator.ultDamage.string()))
        
        return result
    }
}
