//
//  JouleAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class JouleAnalysis: AbilityAnalysis {
    
    var calculator: Joule {
        return Joule(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())

        result.append(("A ability raw damage".localizedString(), calculator.aAbilityRawDamage.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability raw weapon DPS".localizedString(), calculator.bAbilityRawWeaponDPS.string()))
        
        result.append(("B ability raw crystal DPS".localizedString(), calculator.bAbilityRawCrystalDPS.string()))
        
        result.append(("Ult raw DPS".localizedString(), calculator.ultRawDPS.string()))
                
        return result
    }
}
