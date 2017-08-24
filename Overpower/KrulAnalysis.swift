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

        result.append(("A ability damage".localizedString(), calculator.aAbilityDamage.string()))
        
        result.append(("Health barrier".localizedString(), calculator.aAbilityBarrier.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability full stack damage".localizedString(), calculator.bAbilityFullStackDamage.string()))
        
        result.append(("Full stack heal".localizedString(), calculator.bAbilityFullStackHeal.string()))
        
        result.append(("3 stacks damage".localizedString(), calculator.bAbilityThreeStackDamage.string()))
        
        result.append(("3 stack heal".localizedString(), calculator.bAbilityThreeStackHeal.string()))
        
        result.append(("No stack damage".localizedString(), calculator.bAbilityNoStackDamage.string()))
        
        result.append(("No stack heal".localizedString(), calculator.bAbilityNoStackHeal.string()))
        
        result.append(("Weakness duration".localizedString(), roundedString(calculator.bAbilityWeaknessDuration)))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Ult damage".localizedString(), calculator.ultDamage.string()))
        
        result.append(("Max stun plus slow duration".localizedString(), roundedString(calculator.ultMaxStunPlusSlowDuration)))
        
        result.append(("Max stun duration".localizedString(), roundedString(calculator.ultMaxStunDuration)))
        
        result.append(("Minimum stun plus slow duration".localizedString(), roundedString(calculator.ultMinStunPlusSlowDuration)))
        
        result.append(("Minimum stun duration".localizedString(), roundedString(calculator.ultMinStunDuration)))
        
        return result
    }
}
