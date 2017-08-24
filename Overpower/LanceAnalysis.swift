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

        result.append(("A ability damage".localizedString(), calculator.aAbilityDamage.string()))
        
        result.append(("Root duration".localizedString(), roundedString(calculator.aAbilityRootDuration)))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability damage".localizedString(), calculator.bAbilityDamage.string()))
        
        result.append(("Stun duration".localizedString(), roundedString(calculator.bAbilityStunDuration)))
        
        result.append(("Passive damage reduction".localizedString(), percentageString(calculator.bAbilityPassiveDamageReduction)))
        
        result.append(("Active damage reduction".localizedString(), percentageString(calculator.bAbilityActiveDamageReduction)))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Ult damage".localizedString(), calculator.ultDamage.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.ultCooldown)))
        
        result.append(("A -> Ult -> B combo damage".lowercased(), (calculator.aAbilityDamage + calculator.bAbilityDamage + calculator.ultDamage).string()))
        
        return result
    }
}
