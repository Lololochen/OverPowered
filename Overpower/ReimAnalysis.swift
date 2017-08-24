//
//  ReimAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class ReimAnalysis: AbilityAnalysis {
    
    var calculator: Reim {
        return Reim(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())

        result.append(("A ability initial damage".localizedString(), calculator.aAbilityFirstHitDamage.string()))
        
        result.append(("Shatter damage".localizedString(), calculator.aAbilityShatterDamage.string()))
        
        result.append(("Full damage on chilled target".localizedString(), calculator.aAbilityFullDamageOnChilledEnemy.string()))
        
        result.append(("Fortified health on initial hit".localizedString(), calculator.aAbilityFortifiedHealthOnFirstHit.string()))
        
        result.append(("Max fortified health per use of A ability".localizedString(), calculator.aAbilityMaxFortifiedHealth.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability damage".localizedString(), calculator.bAbilityDamage.string()))
        
        result.append(("Root duration".localizedString(), roundedString(calculator.bAbilityRootDuration)))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Ult center damage".localizedString(), calculator.ultCenterDamage.string()))
        
        result.append(("Damage on the edge".localizedString(), calculator.ultEdgeDamage.string()))
        
        result.append(("Slow strength".localizedString(), percentageString(calculator.ultSlowStrength)))
        
        result.append(("Slow duration on the center".localizedString(), roundedString(calculator.ultCenterSlowDuration)))
        
        result.append(("Slow duration on the edge".localizedString(), roundedString(calculator.ultEdgeSlowDuration)))
        
        result.append(("Stun duration".localizedString(), roundedString(calculator.ultStunDuration)))
        
        return result
    }
}
