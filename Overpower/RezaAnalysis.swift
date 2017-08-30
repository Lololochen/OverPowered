//
//  RezaAnalysis.swift
//  OverPowered
//
//  Created by yy on 2017/8/15.
//  Copyright © 2017年 Bright Future. All rights reserved.
//

import Foundation

class RezaAnalysis: AbilityAnalysis {
    
    var calculator: Reza {
        return Reza(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())
        
        result.append(("Basic attack with bonus raw crystal damage".localizedString(), calculator.basicAttackBonusRawCrystalDamage.string()))
        
        result.append(("A ability raw damage".localizedString(), calculator.aAbilityRawDamage.string()))
    
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability dash raw damage".localizedString(), calculator.bAbilityDashRawDamage.string()))
        
        result.append(("B ability empowered basic attack raw crystal damage".localizedString(), calculator.basicAttackWithBonusDamageRawCrystalDamage.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Ult raw damage".localizedString(), calculator.ultRawDamage.string()))
        
        result.append(("Ult max raw DPS".localizedString(), calculator.ultMaxRawCrystalDPS.string()))
        
        result.append(("Fortified health".localizedString(), calculator.ultFortifiedHealth.string()))
        
        result.append(("Cooldown".localizedString(), calculator.ultCooldown.string()))
        
        return result
    }
}
