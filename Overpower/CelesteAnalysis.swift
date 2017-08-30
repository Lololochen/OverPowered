//
//  CelesteAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class CelesteAnalysis: AbilityAnalysis {
    
    var calculator: Celeste {
        return Celeste(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())

        result.append(("A ability initial raw damage".localizedString(), calculator.aAbilityInitialRawDamage.string()))
        
        result.append(("A ability explosion raw damage".localizedString().localizedString(), calculator.aAbilityExplosionRawDamage.string()))
        
        result.append(("A ability cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability raw damage".localizedString(), calculator.bAbilityRawDamage.string()))
        
        result.append(("Cooldown".localizedString(), calculator.bAbilityCooldown.string()))
        
        result.append(("Ult lead star raw damage".localizedString(), calculator.ultLeadStarRawDamage.string()))
        
        result.append(("Small star raw damage".localizedString(), calculator.ultSmallerStarRawDamage.string()))
    
        return result
    }
}
