//
//  GwenAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class GwenAnalysis: AbilityAnalysis {
    
    var calculator: Gwen {
        return Gwen(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())

        result.append(("A ability raw weapon damage".localizedString(), calculator.aAbilityRawWeaponDamage.string()))
        
        result.append(("A ability raw crystal damage".localizedString(), calculator.aAbilityRawCrystalDamage.string()))
        
        result.append(("Slow factor".localizedString(), percentageString(calculator.aAbilitySlowFactor)))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability speed boost distance".localizedString(), roundedString(calculator.bAbilitySpeedBoostDistance)))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Ult raw weapon damage".localizedString(), calculator.ultRawWeaponDamage.string()))
        
        result.append(("Ult raw crystal damage".localizedString(), calculator.ultRawCrystalDamage.string()))
        
        return result
    }
}
