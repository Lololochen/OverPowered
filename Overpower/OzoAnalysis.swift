//
//  OzoAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class OzoAnalysis: AbilityAnalysis {
    
    var calculator: Ozo {
        return Ozo(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())

        result.append(("Damage per hit".localizedString(), calculator.aAbilityDamagePerHit.string()))
        
        result.append(("Heal from hitting 1 enemy".localizedString(), calculator.aAbilityHealPerHitPerEnemy.string()))
        
        result.append(("Heal from hitting 3 enemy".localizedString(), ((calculator.aAbilityHealPerHitPerEnemy) * 3).string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("First two bounce damage".localizedString(), calculator.bAbilityFirstTwoBounceDamage.string()))
        
        result.append(("3rd bounce damage".localizedString(), calculator.bAbilityThirdBounceDamage.string()))
        
        result.append(("Speed boost".localizedString(), roundedString(calculator.bAbilitySpeedBoost)))
        
        result.append(("Boost duration".localizedString(), roundedString(calculator.bAbilityBoostDuration)))
        
        result.append(("Fortified health per jump".localizedString(), calculator.bAbilityFortifiedHealthPerJump.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Ult damage".localizedString(), calculator.ultDamage.string()))
        
        result.append(("Secondary damage".localizedString(), calculator.ultSecondaryDamage.string()))
        
        return result

    }
}
