//
//  FlickerAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class FlickerAnalysis: AbilityAnalysis {
    
    var calculator: Flicker {
        return Flicker(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())

        result.append(("A ability DPS".localizedString(), calculator.aAbilityDps.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability DPS".localizedString(), calculator.bAbilityDps.string()))
        
        result.append(("Detonate damage".localizedString(), calculator.bAbilityDetonateDamage.string()))
        
        result.append(("Total damage".localizedString(), calculator.bAbilityTotalDamage.string()))
        
        result.append(("Slow strength".localizedString(), percentageString(calculator.bAbilitySlowStrength)))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        return result
    }
}
