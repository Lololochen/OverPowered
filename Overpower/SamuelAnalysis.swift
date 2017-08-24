//
//  SamuelAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class SamuelAnalysis: AbilityAnalysis {
    
    var calculator: Samuel {
        return Samuel(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())

        result.append(("A ability damage per hit".localizedString(), calculator.aAbilityDamage.string()))
        
        result.append(("Plus empowered damage".localizedString(), calculator.aAbilityWithEmpoweredDamage.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability DPS".localizedString(), calculator.bAbilityDps.string()))
        
        result.append(("Heal per second from each enemy standing in Drifting Dark".localizedString(), calculator.bAbilityHealPerSecPerTarget.string()))
        
        result.append(("Heal per second from each minion in Drifting Dark".localizedString(), calculator.bAbilityHealPerSecPerMinion.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Ult damage".localizedString(), calculator.ultDamage.string()))
        
        result.append(("Sleep duration".localizedString(), roundedString(calculator.ultSleepDuration)))
        
        return result
    }
}
