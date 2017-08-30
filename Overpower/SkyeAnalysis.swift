//
//  SkyeAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class SkyeAnalysis: AbilityAnalysis {
    
    var calculator: Skye {
        return Skye(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())

        result.append(("A ability raw weapon DPS".localizedString(), calculator.aAbilityRawWeaponDPS.string()))
        
        result.append(("A ability raw crystal DPS".localizedString(), calculator.aAbilityRawCrystalDPS.string()))
        
        result.append(("A ability lock on raw crystal DPS".localizedString(), calculator.aAbilityLockOnRawCrystalDPS.string()))
        
        result.append(("A ability lock on full raw damage".localizedString(), calculator.aAbilityLockOnFullRawCrystalDamage.string()))
        
        result.append(("Slow strength".localizedString(), percentageString(calculator.aAbilitySlowStrength)))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability raw damage".localizedString(), calculator.bAbilityRawDamage.string()))
    
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Ult raw DPS".localizedString(), calculator.ultRawDPS.string()))
    
        result.append(("Cooldown".localizedString(), calculator.ultCooldown.string()))
        
        return result
    }
}
