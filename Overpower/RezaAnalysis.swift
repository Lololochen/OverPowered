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
        
        result.append(("A ability damage".localizedString(), calculator.aAbilityDamage.string()))
        
        result.append(("Damage with basic attack".localizedString(), calculator.aAbilityDamageWithBasicAttacks.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability damage".localizedString(), calculator.bAbilityDamage.string()))
        
        result.append(("Damage with basic attack without fire".localizedString(), calculator.bAbilityDamageWithBasicAttacksWithoutFire.string()))
        
        result.append(("Damage with basic attack".localizedString(), calculator.bAbilityDamageWithBasicAttacks.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Ult damage".localizedString(), calculator.ultDamage.string()))
        
        result.append(("Ult dps".localizedString(), calculator.ultDps.string()))
        
        result.append(("Fortified health".localizedString(), calculator.ultFortifiedHealth.string()))
        
        result.append(("Ult Duration".localizedString(), calculator.ultDurationTime.string()))
        
        result.append(("Cooldown".localizedString(), calculator.ultCooldown.string()))
        
        return result
    }
}
