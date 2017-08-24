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
        
        result.append(("A ability damage".localizedString(), calculator.aAbilityDamage.string()))
        
        result.append(("Splash damage".localizedString(), calculator.aAbilitySplashDamage.string()))
        
        result.append(("Slow distance \n(how much less the enemy can move when slowed, assuming the enemy doesn't use boots or acceleration abilities)".localizedString(), roundedString(calculator.aAbilitySlowDistance)))
        
        result.append(("Range".localizedString(), calculator.aAbilityRange.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability damage".localizedString(), calculator.bAbilityDamage.string()))
        
        result.append(("Full damage".localizedString(), calculator.bAbilityFullDamage.string()))
        
        result.append(("Stun duration".localizedString(), roundedString(calculator.bAbilityStunDuration)))
        
        result.append(("Range".localizedString(), calculator.bAbilityRange.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Ult total damage".localizedString(), calculator.ultTotalDamage.string()))
    
        return result
    }
}
