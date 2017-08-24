//
//  BlackfeatherAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class BlackfeatherAnalysis: AbilityAnalysis {
    
    var calculator: Blackfeather {
        return Blackfeather(dataSource: dataSource)
    }

    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())

        result.append(("A ability damage without Heartthrob stack".localizedString(), calculator.aAbilityDamageWithoutHeartthrobStack.string()))
        
        result.append(("Damage on full health enemy with full Heartthrob stack".localizedString(), calculator.aAbilityCalcDamageWithHealthPercentage(percentage: 1).string()))
        
        result.append(("Full Heartthrob stack damage can execute enemy with health lower than".localizedString(), percentageString(calculator.aAbilityExecutableHealthPercentage)))
        
        result.append(("A ability cooldown".localizedString(), calculator.aAbilityCooldown.string()))
        
        result.append(("B ability damage".localizedString(), calculator.bAbilityDamage.string()))
        
        result.append(("Slow strength".localizedString(), percentageString(calculator.bAbilitySlow)))
        
        result.append(("Slow duration".localizedString(), roundedString(calculator.bAbilitySlowDuration)))
        
        result.append(("B ability cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Focus cost when hitting an enemy".localizedString(), calculator.bAbilityFocusCostWhenHittingEnemy.string()))
        
        result.append(("Ult damage".localizedString(), calculator.ultDamage.string()))
        
        result.append(("Fortified health".localizedString(), calculator.ultFortifiedHealth.string()))
        
        result.append(("Charge time".localizedString(), calculator.ultChargeTime.string()))
        
        return result
    }
}
