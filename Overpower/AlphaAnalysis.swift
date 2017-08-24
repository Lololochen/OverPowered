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
        
        result.append(("A ability no stack damage".localizedString(), calculator.aAbilityNoStackDamage.string()))
        
        result.append(("Full stack damage".localizedString(), calculator.aAbilityFullStackDamage.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability damage".localizedString(), calculator.bAbilityDamage.string()))
        
        result.append(("Max heal per second (lifesteal effects not added)".localizedString(), calculator.bAbilityMaxHealPerSec.string()))
        
        result.append(("Full stack damage".localizedString(), calculator.bAbilityFullStackDamage.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Miminum cooldown in fight (basic attacking enemy non-stop)".localizedString(), roundedString(calculator.bAbilityMimimumCooldownInFight)))
        
        result.append(("Ult damage".localizedString(), calculator.ultDamage.string()))
        
        return result
    }

    
}
