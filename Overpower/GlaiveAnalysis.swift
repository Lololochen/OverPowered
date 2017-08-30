//
//  GlaiveAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class GlaiveAnalysis: AbilityAnalysis {
    
    var calculator: Glaive {
        return Glaive(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())

        result.append(("A ability raw damage".localizedString(), calculator.aAbilityRawDamage.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability raw damage".localizedString(), calculator.bAbilityRawDamage.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Ult full stack raw damage".localizedString(), calculator.ultFullStackRawDamage.string()))
        
        result.append(("Raw damage with no stack".localizedString(), calculator.ultRawDamageWithNoStack.string()))
        
        result.append(("Cooldown".localizedString(), calculator.ultCooldown.string()))
        
        return result
    }
}
