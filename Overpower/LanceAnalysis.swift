//
//  LanceAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class LanceAnalysis: AbilityAnalysis {
    
    var calculator: Lance {
        return Lance(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())
        
        result.append(("A ability raw weapon damage".localizedString(), calculator.aAbilityRawWeaponDamage.string()))

        result.append(("A ability raw crystal damage".localizedString(), calculator.aAbilityRawCrystalDamage.string()))
        
        result.append(("Root duration".localizedString(), roundedString(calculator.aAbilityRootDuration)))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability raw weapon damage".localizedString(), calculator.bAbilityRawWeaponDamage.string()))
        
        result.append(("B ability raw crystal damage".localizedString(), calculator.bAbilityRawCrystalDamage.string()))
        
        result.append(("Stun duration".localizedString(), roundedString(calculator.bAbilityStunDuration)))
        
        result.append(("Passive damage reduction".localizedString(), percentageString(calculator.bAbilityPassiveDamageReduction)))
        
        result.append(("Active damage reduction".localizedString(), percentageString(calculator.bAbilityActiveDamageReduction)))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Ult raw bonus damage".localizedString(), calculator.ultRawBonusDamage.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.ultCooldown)))
        
        return result
    }
}
