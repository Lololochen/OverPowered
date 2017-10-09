//
//  BaronAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class BaronAnalysis: AbilityAnalysis {
    
    var calculator: Baron {
        return Baron(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())
        
        result.append(("A ability raw crystal damage per shot".localizedString(), calculator.aAbilityRawCrystalDamage.string()))
        
        result.append(("A ability raw weapon damage per shot".localizedString(), calculator.aAbilityRawWeaponDamage.string()))
        
        result.append(("Slow factor".localizedString(), percentageString(calculator.aAbilitySlowFactor)))
        
        result.append(("Range".localizedString(), roundedString(calculator.aAbilityRange)))
        
        result.append(("Charge time".localizedString(), roundedString(calculator.aAbilityChargeTime)))
        
        result.append(("B ability range".localizedString(), calculator.bAbilityRange.string()))
       
        result.append(("Speed boost".localizedString(), calculator.bAbilitySpeedBoost.string()))
        
        result.append(("Cooldown".localizedString(), calculator.bAbilityCooldown.string()))
        
        result.append(("Miminum cooldown in fight (basic attacking enemy non-stop)".localizedString(), roundedString(calculator.bAbilityCooldownInFight)))
        
        result.append(("Ult center raw crystal damage".localizedString(), calculator.ultRawCrystalDamage.string()))
        
        result.append(("Ult center raw weapon damage".localizedString(), calculator.ultRawWeaponDamage.string()))
        
        return result
    }
}
