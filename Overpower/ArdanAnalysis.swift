//
//  ArdanAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class ArdanAnalysis: AbilityAnalysis {
    
    var calculator: Ardan {
        return Ardan(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())

        result.append(("A ability Raw crystal Damage".localizedString(), calculator.aAbilityDamage.string()))
        
        result.append(("Barrier".localizedString(), calculator.aAbilityBarrier.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability raw crystal damage".localizedString(), calculator.bAbilityRawCrystalDamage.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Ult raw crystal damage".localizedString(), calculator.ultDamage.string()))
        
        return result
    }
    
}
