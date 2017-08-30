//
//  BlackfeatherAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class BlackfeatherAnalysis: AbilityAnalysis {
    
    var calculator: Blackfeather {
        return Blackfeather(dataSource: dataSource)
    }

    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())

        result.append(("A ability raw crystal damage".localizedString(), calculator.aAbilityRawCrystalDamage.string()))
        
        result.append(("A ability cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability raw crystal damage".localizedString(), calculator.bAbilityRawCrystalDamage.string()))
        
        result.append(("B ability raw weapon damage".localizedString(), calculator.bAbilityRawWeaponDamage.string()))
        
        result.append(("Slow factor".localizedString(), roundedString(calculator.bAbilitySlowFactor)))
        
        result.append(("B ability cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Focus cost when hitting an enemy".localizedString(), calculator.bAbilityFocusCostWhenHittingEnemy.string()))
        
        result.append(("Ult raw crystal damage".localizedString(), calculator.ultRawCrystalDamage.string()))
        
        result.append(("Charge time".localizedString(), calculator.ultChargeTime.string()))
        
        return result
    }
}
