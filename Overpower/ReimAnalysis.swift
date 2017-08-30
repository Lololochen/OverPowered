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

        result.append(("A ability initial raw damage".localizedString(), calculator.aAbilityFirstHitRawDamage.string()))
        
        result.append(("A ability shatter raw damage".localizedString(), calculator.aAbilityShatterRawDamage.string()))
        
        result.append(("Full raw damage on chilled target".localizedString(), calculator.aAbilityRawFullDamageOnChilledEnemy.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability raw damage".localizedString(), calculator.bAbilityRawDamage.string()))
            
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Ult center raw damage".localizedString(), calculator.ultCenterRawDamage.string()))
        
        result.append(("Raw damage on the edge".localizedString(), calculator.ultEdgeRawDamage.string()))
        
        result.append(("Slow factor on the center".localizedString(), roundedString(calculator.ultCenterSlowFactor)))
        
        result.append(("Slow factor on the edge".localizedString(), roundedString(calculator.ultEdgeSlowFactor)))
                
        return result
    }
}
