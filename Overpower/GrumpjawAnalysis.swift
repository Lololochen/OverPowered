//
//  GrumpjawAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class GrumpjawAnalysis: AbilityAnalysis {
    
    var calculator: Grumpjaw {
        return Grumpjaw(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())

        result.append(("A ability full stack damage".localizedString(), calculator.aAbilityFullStackDamage.string()))
        
        result.append(("Damage with no stack".localizedString(), calculator.aAbilityNoStackDamage.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability DPS".localizedString(), calculator.bAbilityDps.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Ult damage".localizedString(), calculator.ultDamage.string()))
        
        return result
    }
}
