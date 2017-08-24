//
//  GwenAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class GwenAnalysis: AbilityAnalysis {
    
    var calculator: Gwen {
        return Gwen(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())

        result.append(("A ability damage".localizedString(), calculator.aAbilityDamage.string()))
        
        result.append(("Slow strength".localizedString(), percentageString(calculator.aAbilitySlowStrength)))
        
        result.append(("Slow duration".localizedString(), 2.0.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability speed boost".localizedString(), roundedString(calculator.bAbilitySpeedBoost)))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Ult damage".localizedString(), calculator.ultDamage.string()))
        
        result.append(("Stun duration".localizedString(), roundedString(calculator.ultStunDuration)))
        
        return result
    }
}
