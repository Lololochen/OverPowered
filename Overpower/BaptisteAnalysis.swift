//
//  BaptisteAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 29/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class BaptisteAnalysis: AbilityAnalysis {
    
    var calculator: Baptiste {
        return Baptiste(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())
        
        result.append(("Passive full stack heal".localizedString(), calculator.passiveFullStackHeal.string()))
        
        result.append(("A ability raw crystal damage".localizedString(), calculator.aAbilityRawCrystalDamage.string()))
        
        result.append(("Splash raw crystal damage".localizedString(), calculator.aAbilitySplashRawCrystalDamage.string()))
        
        result.append(("Slow factor".localizedString(), roundedString(calculator.aAbilitySlowFactor)))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability raw crystal damage".localizedString(), calculator.bAbilityRawCrystalDamage.string()))
        
        result.append(("Tether break raw crystal damage".localizedString(), calculator.bAbilityTetherBreakRawCrystalDamage.string()))
        
        result.append(("Range".localizedString(), calculator.bAbilityRange.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Ult total raw crystal damage".localizedString(), calculator.ultTotalRawCrystalDamage.string()))
    
        return result
    }
}
