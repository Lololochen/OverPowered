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
        
        result.append(("A ability raw DPS".localizedString(), calculator.aAbilityRawDps.string()))
        
        result.append(("A ability detonate raw damage".localizedString(), calculator.aAbilityDetonateRawDamage.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability raw damage".localizedString(), calculator.bAbilityRawDamage.string()))
        
        result.append(("Cooldown".localizedString(), calculator.bAbilityCooldown.string()))
                
        return result
    }
}
