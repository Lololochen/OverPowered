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

        result.append(("A ability full stack raw damage".localizedString(), calculator.aAbilityFullStackRawDamage.string()))
        
        result.append(("No stack raw damage".localizedString(), calculator.aAbilityNoStackRawDamage.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability raw crystal DPS".localizedString(), calculator.bAbilityRawCrystalDPS.string()))
        
        result.append(("B ability raw weapon DPS".localizedString(), calculator.bAbilityRawWeaponDPS.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Ult raw damage".localizedString(), calculator.ultRawDamage.string()))
        
        return result
    }
}
