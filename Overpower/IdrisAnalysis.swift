//
//  IdrisAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class IdrisAnalysis: AbilityAnalysis {
    
    var calculator: Idris {
        return Idris(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())

        result.append(("A ability barrier".localizedString(), calculator.aAbilityBarrier.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("Miminum cooldown in fight (basic attacking enemy non-stop)".localizedString(), roundedString(calculator.aAbilityCooldownInFight)))
        
        result.append(("B ability raw crystal damage".localizedString(), calculator.bAbilityRawCrystalDamage.string()))
        
        result.append(("B ability raw weapon damage".localizedString(), calculator.bAbilityRawWeaponDamage.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Ult raw weapon damage".localizedString(), calculator.ultRawWeaponDamage.string()))
        
        return result
    }
}
