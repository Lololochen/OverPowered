//
//  SkaarfAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class SkaarfAnalysis: AbilityAnalysis {
    
    var calculator: Skaarf {
        return Skaarf(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())

        result.append(("A ability damage".localizedString(), calculator.aAbilityDamage.string()))
        
        result.append(("Max DPS with basic attacks (assuming you land every shot)".localizedString(), calculator.aAbilityMaxDPSWithBasicAttacks.string()))
        
        result.append(("Fire ball travel time".localizedString(), roundedString(calculator.aAbilityFireBallTravelTime)))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability ignite damage".localizedString(), calculator.bAbilityIgniteDamage.string()))
        
        result.append(("Burning DPS".localizedString(), calculator.bAbilityDps.string()))
        
        result.append(("Burning duration".localizedString(), calculator.bAbilityBurnDuration.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Ult DPS".localizedString(), calculator.ultDps.string()))
        
        result.append(("Total damage".localizedString(), calculator.ultDamage.string()))
        
        result.append(("Fortified health".localizedString(), calculator.ultFortifiedHealth.string()))
        
        return result

    }
}
