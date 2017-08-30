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

        result.append(("A ability raw damage per hit".localizedString(), calculator.aAbilityRawDamagePerHit.string()))
        
        result.append(("A ability raw DPS inside Drifting Dark".localizedString(), calculator.empoweredRawDPS.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability raw DPS".localizedString(), calculator.bAbilityRawDps.string()))
        
        result.append(("Heal per second from each enemy standing in Drifting Dark".localizedString(), calculator.bAbilityHealPerSecPerTarget.string()))
        
        result.append(("Heal per second from each minion in Drifting Dark".localizedString(), calculator.bAbilityHealPerSecPerMinion.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Ult raw damage".localizedString(), calculator.ultRawDamage.string()))
        
        return result
    }
}
