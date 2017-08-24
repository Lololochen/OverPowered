//
//  GraceAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 26/06/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class GraceAnalysis: AbilityAnalysis {
    
    var calculator: Grace {
        return Grace(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())
        result.append(("Empowered basic attack slow distance".localizedString(), roundedString(calculator.empoweredBasicAttackSlowDistance)))
        result.append(("A ability bonus damage".localizedString(), calculator.aAbilityBonusDamage.string()))
        result.append(("A ability cooldown".localizedString(), calculator.aAbilityCooldown.rounded().string()))
        result.append(("B ability damage".localizedString(), calculator.bAbilityDamage.string()))
        result.append(("B ability cooldown".localizedString(), calculator.bAbilityCooldown.rounded().string()))
        result.append(("Ult heal".localizedString(), calculator.ultHeal.string()))
        result.append(("Ult cooldown".localizedString(), calculator.ultCooldown.rounded().string()))
        
        return result
    }

}
