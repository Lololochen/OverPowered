//
//  CelesteAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class CelesteAnalysis: AbilityAnalysis {
    
    var calculator: Celeste {
        return Celeste(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())

        result.append(("A ability initial damage".localizedString(), calculator.aAbilitySmallStarDamage.string()))
        
        result.append(("Supernova damage".localizedString().localizedString(), calculator.aAbilityNovaDamage.string()))
        
        result.append(("A ability cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability damage".localizedString(), calculator.bAbilityDamage.string()))
        
        result.append(("Stun duration".localizedString(), roundedString(calculator.bAbilityStunDuration)))
        
        result.append(("Cooldown".localizedString(), calculator.bAbilityCooldown.string()))
        
        result.append(("Ult lead star damage".localizedString(), calculator.ultLeadStarDamage.string()))
        
        result.append(("Small star damage".localizedString(), calculator.ultSmallerStarDamage.string()))
        
        result.append(("3 small star damage".localizedString(), (calculator.ultSmallerStarDamage * 3).string()))
        
        result.append(("3 stars damage with lead star".localizedString(), (calculator.ultLeadStarDamage + calculator.ultSmallerStarDamage * 2).string()))
        
        return result
    }
}
