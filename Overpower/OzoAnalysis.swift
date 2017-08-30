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

        result.append(("A ability raw weapon damage per hit".localizedString(), calculator.aAbilityRawWeaponDamagePerHit.string()))
        
        result.append(("A ability raw crystal damage per hit".localizedString(), calculator.aAbilityRawCrystalDamagePerHit.string()))
        
        result.append(("Heal from hitting 1 enemy".localizedString(), calculator.aAbilityHealPerHitPerEnemy.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("First two bounce raw damage".localizedString(), calculator.bAbilityFirstTwoBounceRawDamage.string()))
        
        result.append(("3rd bounce raw damage".localizedString(), calculator.bAbilityThirdBounceRawDamage.string()))
        
        result.append(("Speed boost".localizedString(), roundedString(calculator.bAbilitySpeedBoost)))
        
        result.append(("Boost duration".localizedString(), roundedString(calculator.bAbilityBoostDuration)))
        
        result.append(("Fortified health per jump".localizedString(), calculator.bAbilityFortifiedHealthPerJump.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Ult raw damage".localizedString(), calculator.ultRawDamage.string()))
        
        result.append(("Secondary target raw damage".localizedString(), calculator.ultSecondaryTargetRawDamage.string()))
        
        return result

    }
}
