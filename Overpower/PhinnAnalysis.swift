//
//  PhinnAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class PhinnAnalysis: AbilityAnalysis {
    
    var calculator: Phinn {
        return Phinn(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())

        result.append(("A ability damage".localizedString(), calculator.aAbilityDamage.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability damage".localizedString(), calculator.bAbilityDamage.string()))
        
        result.append(("Fortified health on allies".localizedString(), calculator.bAbilityFortifiedHealth.string()))
        
        result.append(("Armor increase on allies".localizedString(), calculator.bAbilityArmorIncrease.string()))
        
        result.append(("Shield increase on allies".localizedString(), calculator.bAbilityShieldIncrease.string()))
        
        result.append(("Duration".localizedString(), roundedString(calculator.bAbilityDuration)))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Ult damage".localizedString(), calculator.ultDamage.string()))
        
        return result
    }
}
