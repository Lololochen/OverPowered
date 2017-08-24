//
//  BaronAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class BaronAnalysis: AbilityAnalysis {
    
    var calculator: Baron {
        return Baron(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())

        result.append(("A ability damage".localizedString(), calculator.aAbilityDamage.string()))
        
        result.append(("Max DPS".localizedString(), calculator.aAbilityMaxDPS.string()))
        
        result.append(("Slow strength".localizedString(), percentageString(calculator.aAbilitySlow)))
        
        result.append(("Range".localizedString(), roundedString(calculator.aAbilityRange)))
        
        result.append(("Charge time".localizedString(), roundedString(calculator.aAbilityChargeTime)))
        
        result.append(("B ability range".localizedString(), calculator.bAbilityRange.string()))
        
        result.append(("2 shots after jump damage".localizedString(), calculator.bAbilityTwoShotDamage.string()))
        
        result.append(("Speed boost".localizedString(), calculator.bAbilitySpeedBoost.string()))
        
        result.append(("B ability cooldown".localizedString(), calculator.bAbilityCooldown.string()))
        
        result.append(("Miminum cooldown in fight (basic attacking enemy non-stop)".localizedString(), roundedString(calculator.bAbilityCooldownInFight)))
        
        result.append(("Ult center damage".localizedString(), calculator.ultDamageInCenter.string()))
        
        result.append(("Damage on the edge".localizedString(), calculator.ultDamageOnTheEdge.string()))
        
        result.append(("Ult range".localizedString(), calculator.ultRange.string()))
        
        result.append(("Basic attack range".localizedString(), roundedString(calculator.ultBasicAttackRange)))

        return result
    }
}
