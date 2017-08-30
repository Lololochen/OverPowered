//
//  RonaAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class RonaAnalysis: AbilityAnalysis {
    
    var calculator: Rona {
        return Rona(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())

        result.append(("A ability impact raw crystal damage".localizedString(), calculator.aAbilityImpactRawCrystalDamage.string()))
        
        result.append(("A ability rupture raw crystal damage".localizedString(), calculator.aAbilityRuptureRawCrystalDamage.string()))
    
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability activate twice raw weapon DPS".localizedString(), calculator.bAbilityActivateTwiceRawWeaponDPS.string()))
        
        result.append(("B ability activate twice raw crystal DPS".localizedString(), calculator.bAbilityActivateTwiceRawCrystalDPS.string()))

        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Miminum cooldown in fight (basic attacking enemy non-stop)".localizedString(), roundedString(calculator.bAbilityCooldownInFight)))
        
        result.append(("Ult raw weapon DPS".localizedString(), calculator.ultRawWeaponDPS.string()))
        
        result.append(("Ult raw crystal DPS".localizedString(), calculator.ultRawCrystalDPS.string()))
        
        return result
    }
}
