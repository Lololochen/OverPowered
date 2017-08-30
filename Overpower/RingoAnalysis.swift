//
//  RingoAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class RingoAnalysis: AbilityAnalysis {
    
    var calculator: Ringo {
        return Ringo(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())

        result.append(("A ability raw damage".localizedString(), calculator.aAbilityRawDamage.string()))
        
        result.append(("A ability slow factor".localizedString(), roundedString(calculator.aAbilitySlowFactor)))
        
        result.append(("A ability cooldown".localizedString(), calculator.aAbilityCooldown.string()))
        
        result.append(("B ability raw weapon DPS".localizedString(), calculator.bAbilityRawWeaponDPS.string()))
        
        result.append(("B ability raw crystal DPS".localizedString(), calculator.bAbilityRawCrystalDPS.string()))
        
        result.append(("B ability cooldown".localizedString(), calculator.bAbilityCooldown.string()))
        
        result.append(("Ult raw impact damage".localizedString(), calculator.ultImpactDamage.string()))
        
        result.append(("Ult total raw damage".localizedString(), calculator.ultTotalRawDamage.string()))
        
        return result
    }
}
