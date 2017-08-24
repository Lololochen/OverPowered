//
//  GlaiveAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class GlaiveAnalysis: AbilityAnalysis {
    
    var calculator: Glaive {
        return Glaive(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())

        result.append(("A ability damage".localizedString(), calculator.aAbilityDamage.string()))
        
        result.append(("Damage with a basic attack".localizedString(), calculator.aAbilityDamageWithBasicAttack.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability damage".localizedString(), calculator.bAbilityDamage.string()))
        
        result.append(("AOE damage".localizedString(), calculator.bAbilityAoeDamage.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Ult full stack damage".localizedString(), calculator.ultFullStackDamage.string()))
        
        result.append(("Damage with no stack".localizedString(), calculator.ultDamageWithoutStack.string()))
        
        result.append(("A ➝ basic attack (without Aftershock effect) ➝ B ➝ full stack Ult combo damage".localizedString(), (calculator.aAbilityDamageWithBasicAttack + calculator.bAbilityDamage + calculator.ultFullStackDamage).string()))
        
        result.append(("Cooldown".localizedString(), calculator.ultCooldown.string()))
        
        return result
    }
}
