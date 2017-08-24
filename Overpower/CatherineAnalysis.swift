//
//  CatherineAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class CatherineAnalysis: AbilityAnalysis {
    
    var calculator: Catherine {
        return Catherine(dataSource: dataSource)
    }

    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())

        result.append(("A ability damage".localizedString(), calculator.aAbilityDamage.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability bubble burning DPS".localizedString(), calculator.bAbilityDps.string()))
        
        result.append(("Minimum deflectable damage".localizedString(), calculator.bAbilityMinimumReflexableDamage.string()))
        
        result.append(("Minimum deflection damage".localizedString(), calculator.bAbilityMinimumReflexDamage.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Ult damage".localizedString(), calculator.ultDamage.string()))
        
        result.append(("Silence duration".localizedString(), roundedString(calculator.ultSilenceDuration)))
        
        return result
    }
}
