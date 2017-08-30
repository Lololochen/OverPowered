//
//  AlphaAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class AlphaAnalysis: AbilityAnalysis {
    
    var calculator: Alpha {
        return Alpha(dataSource: dataSource)
    }

    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())
        
        result.append(("Reboot health".localizedString(), calculator.ultRebootHealth.string()))
        
        result.append(("Reboot duration".localizedString(), roundedString(calculator.ultRebootDuration)))
        
        result.append(("Minimum enemy DPS to stop the reboot".localizedString(), calculator.ultLethalDPS.string()))
        
        result.append(("A ability no stack raw crystal damage".localizedString(), calculator.aAbilityNoStackRawCrystalDamage.string()))
        
        result.append(("A ability no stack raw weapon damage".localizedString(), calculator.aAbilityNoStackRawWeaponDamage.string()))
        
        result.append(("Full stack raw crystal damage".localizedString(), calculator.aAbilityFullStackRawCrystalDamage.string()))
        
        result.append(("Full stack raw weapon damage".localizedString(), calculator.aAbilityFullStackRawWeaponDamage.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("B ability Miminum cooldown with basic attacks".localizedString(), roundedString(calculator.bAbilityMimimumCooldownInFight)))
        
        result.append(("Ult raw damage".localizedString(), calculator.ultRawDamage.string()))
        
        return result
    }

    
}
