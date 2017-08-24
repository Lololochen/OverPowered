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

        result.append(("A ability amplified basic attack damage".localizedString(), calculator.AbilityAmplifiedDamage.string()))
        
        result.append(("Health barrier".localizedString(), calculator.AbilityBarrier.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.AbilityCooldown)))
        
        result.append(("Miminum cooldown in fight (basic attacking enemy non-stop)".localizedString(), roundedString(calculator.AbilityCooldownInFight)))
        
        result.append(("B ability damage".localizedString(), calculator.bAbilityDamage.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Ult damage".localizedString(), calculator.ultDamage.string()))
        
        return result
    }
}
