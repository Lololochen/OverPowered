//
//  KrulAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class KrulAnalysis: AbilityAnalysis {
    
    var calculator: Krul {
        return Krul(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())

        result.append(("A ability raw weapon damage".localizedString(), calculator.aAbilityRawWeaponDamage.string()))
        
        result.append(("A ability raw crystal damage".localizedString(), calculator.aAbilityRawCrystalDamage.string()))
        
        result.append(("Health barrier".localizedString(), calculator.aAbilityBarrier.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability no stack raw damage".localizedString(), calculator.bAbilityNoStackRawDamage.string()))
        
        result.append(("B ability full stack raw damage".localizedString(), calculator.bAbilityFullStackRawDamage.string()))
        
        result.append(("No stack heal".localizedString(), calculator.bAbilityNoStackHeal.string()))
        
        result.append(("Full stack heal".localizedString(), calculator.bAbilityFullStackHeal.string()))
        
        result.append(("Weakness duration".localizedString(), roundedString(calculator.bAbilityWeaknessDuration)))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Ult raw damage".localizedString(), calculator.ultRawDamage.string()))
        
        result.append(("Max stun plus slow duration".localizedString(), roundedString(calculator.ultMaxStunPlusSlowDuration)))
        
        result.append(("Max stun duration".localizedString(), roundedString(calculator.ultMaxStunDuration)))
        
        result.append(("Minimum stun plus slow duration".localizedString(), roundedString(calculator.ultMinStunPlusSlowDuration)))
        
        result.append(("Minimum stun duration".localizedString(), roundedString(calculator.ultMinStunDuration)))
        
        return result
    }
}
