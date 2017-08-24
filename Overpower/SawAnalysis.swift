//
//  SawAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class SawAnalysis: AbilityAnalysis {
    
    var calculator: Saw {
        return Saw(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())

        result.append(("A ability damage on full health target".localizedString(), calculator.aAbilityDamageOnFullHealthEnemy.string()))
        
        result.append(("Can kill enemy with health lower than".localizedString(), percentageString(calculator.aAbilityExecutableHealthPercentage)))
        
        result.append(("Speed boost".localizedString(), roundedString(calculator.aAbilitySpeedBoost)))
        
        result.append(("A ability cooldown".localizedString(), calculator.aAbilityCooldown.string()))
        
        result.append(("B ability total damage".localizedString(), calculator.bAbilityTotalDamage.string()))
        
        result.append(("Slow duration".localizedString(), roundedString(calculator.bAbilitySlowDuration)))
        
        result.append(("B ability cooldown".localizedString(), calculator.bAbilityCooldown.string()))
        
        return result
    }
}
