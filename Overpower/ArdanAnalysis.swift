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

        result.append(("A ability barrier".localizedString(), calculator.aAbilityBarrier.string()))
        
        result.append(("Damage".localizedString(), calculator.aAbilityDamage.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability damage".localizedString(), calculator.bAbilityDamage.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Ult damage".localizedString(), calculator.ultDamage.string()))
        
        return result
    }
    
}
