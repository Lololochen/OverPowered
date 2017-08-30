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

        result.append(("A ability raw DPS".localizedString(), calculator.aAbilityRawDps.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability raw DPS".localizedString(), calculator.bAbilityRawDps.string()))
        
        result.append(("Raw detonate damage".localizedString(), calculator.bAbilityDetonateRawDamage.string()))
        
        result.append(("Total raw damage".localizedString(), calculator.bAbilityTotalRawDamage.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        return result
    }
}
