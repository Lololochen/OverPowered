//
//  FortressAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class FortressAnalysis: AbilityAnalysis {
    
    var calculator: Fortress {
        return Fortress(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())

        result.append(("A ability raw damage".localizedString(), calculator.aAbilityRawDamage.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability on hit raw damage".localizedString(), calculator.bAbilityOnHitRawDamage.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Bleeding effect raw DPS".localizedString(), calculator.bleedRawDPS.string()))
        
        result.append(("Wolf raw DPS with bleeding effect".localizedString(), calculator.ultDpsPerWolf.string()))
        
        return result
    }
}
