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

        result.append(("A ability raw damage".localizedString(), calculator.aAbilityRawDamage.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability raw damage".localizedString(), calculator.bAbilityRawDamage.string()))
        
        result.append(("Fortified health on allies".localizedString(), calculator.bAbilityFortifiedHealth.string()))
        
        result.append(("Armor increase on allies".localizedString(), calculator.bAbilityArmorIncrease.string()))
        
        result.append(("Shield increase on allies".localizedString(), calculator.bAbilityShieldIncrease.string()))
                
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Ult raw damage".localizedString(), calculator.ultRawDamage.string()))
        
        return result
    }
}
