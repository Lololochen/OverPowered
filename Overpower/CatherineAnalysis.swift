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

        result.append(("A ability raw damage".localizedString(), calculator.aAbilityRawCrystalDamage.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability bubble burning raw DPS".localizedString(), calculator.bAbilityRawDps.string()))
        
        result.append(("Minimum deflectable damage".localizedString(), calculator.bAbilityMinimumReflexableDamage.string()))
    
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Ult raw damage".localizedString(), calculator.ultRawDamage.string()))
        
        return result
    }
}
