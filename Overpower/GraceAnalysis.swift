//
//  GraceAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 26/06/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class GraceAnalysis: AbilityAnalysis {
    
    var calculator: Grace {
        return Grace(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())
        result.append(("Empowered basic attack slow factor".localizedString(), roundedString(calculator.empoweredBasicAttackSlowFactor)))
        result.append(("A ability raw crystal bonus damage".localizedString(), calculator.aAbilityRawCrystalBonusDamage.string()))
        result.append(("A ability raw weapon bonus damage".localizedString(), calculator.aAbilityRawWeaponBonusDamage.string()))
        result.append(("A ability cooldown".localizedString(), calculator.aAbilityCooldown.rounded().string()))
        result.append(("B ability raw damage".localizedString(), calculator.bAbilityRawDamage.string()))
        result.append(("B ability cooldown".localizedString(), calculator.bAbilityCooldown.rounded().string()))
        result.append(("Ult heal".localizedString(), calculator.ultHeal.string()))
        result.append(("Ult cooldown".localizedString(), calculator.ultCooldown.rounded().string()))
        
        return result
    }

}
