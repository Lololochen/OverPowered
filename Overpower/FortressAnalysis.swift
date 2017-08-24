//
//  FortressAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class FortressAnalysis: AbilityAnalysis {
    
    var calculator: Fortress {
        return Fortress(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())

        result.append(("A ability damage".localizedString(), calculator.aAbilityDamage.string()))
        
        result.append(("Speed boost".localizedString(), roundedString(calculator.aAbilitySpeedBoost)))
        
        result.append(("Duration".localizedString(), calculator.aAbilityDuration.string()))
        
        result.append(("Lifesteal".localizedString(), percentageString(calculator.aAbilityLifeSteal)))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability initial damage".localizedString(), calculator.bAbilityDamage.string()))
        
        result.append(("Full bleeding stack damage".localizedString(), calculator.bAbilityFullStackDamage.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Ult duration".localizedString(), calculator.ultDuration.string()))
        
        result.append(("Attack speed increase".localizedString(), percentageString(calculator.ultAttackSpeedIncrease)))
        
        result.append(("Fortified health".localizedString(), calculator.ultFortifiedHealth.string()))
        
        result.append(("Wolf DPS with bleeding effect".localizedString(), calculator.ultWolfDPS.string()))
        
        result.append(("Bleeding stack applied per second".localizedString(), calculator.ultBleedingStackAppliedPerSec.string()))
        
        return result
    }
}
