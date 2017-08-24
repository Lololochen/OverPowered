//
//  LyraAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class LyraAnalysis: AbilityAnalysis {
    
    var calculator: Lyra {
        return Lyra(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())

        result.append(("A ability heal per second".localizedString(), calculator.aAbilityHealPerSec.string()))
        
        result.append(("Max heal".localizedString(), calculator.aAbilityMaxHeal.string()))
        
        result.append(("Damage per second".localizedString(), calculator.aAbilityDps.string()))
        
        result.append(("Detonate damage".localizedString(), calculator.aAbilityDetonateDamage.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability damage".localizedString(), calculator.bAbilityDamage.string()))
        
        result.append(("Cooldown".localizedString(), calculator.bAbilityCooldown.string()))
        
        result.append(("Ult range".localizedString(), calculator.ultRange.string()))
        
        return result
    }
}
